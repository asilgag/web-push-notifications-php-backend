<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Subscription;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction()
    {
        return $this->redirect(
            $this->generateUrl('show_subscriptions')
        );
    }

    /**
     * @Route("/admin/show-subscriptions", name="show_subscriptions")
     */
    public function showSubscriptionsAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $repository = $em->getRepository('AppBundle:Subscription');
        $subscriptions = $repository->findAll();

        if (!$subscriptions) {
            throw $this->createNotFoundException('Unable to find any Subscription entity.');
        }

        // replace this example code with whatever you need
        return $this->render(
            'default/show.html.twig',
            [
                'subscriptions' => $subscriptions,
            ]
        );
    }


    /**
     * @Route("/admin/send-notification/{id}/{eventId}", name="send_notification")
     */
    public function sendNotificationAction($id, $eventId = null)
    {
        $em = $this->getDoctrine()->getManager();
        $repository = $em->getRepository('AppBundle:Subscription');
        $subscription = $repository->find($id);

        if (!$subscription) {
            throw $this->createNotFoundException('Unable to find Subscription entity.');
        }

        $webPushNotificationService = $this->get('web_push_notification_service');
        $events = $subscription->getEvents();
        foreach ($events as $event) {
            if (!$eventId || $event->getId() == $eventId) {
                $res = $webPushNotificationService->sendNotification(
                    $subscription,
                    $event
                );
            }
        }

        // replace this example code with whatever you need
        return $this->render(
            'default/send.html.twig',
            [
                'subscription' => $subscription,
            ]
        );
    }

    /**
     * @Route("/get-events.json", name="get_events")
     * @Method("POST")
     * @param Request $request
     * @return JsonResponse
     */
    public function getEventsAction(Request $request)
    {
        // Get POST content data
        $subscriptionToFind = json_decode($request->getContent());

        // Find subscription if POST data is OK
        if ($subscriptionToFind
            && isset($subscriptionToFind->endpoint)
            && isset($subscriptionToFind->keys->p256dh)
            && isset($subscriptionToFind->keys->auth)
        ) {
            $em = $this->getDoctrine()->getManager();
            $repository = $em->getRepository('AppBundle:Subscription');
            $subscription = $repository->findOneBy(
                [
                    'endpoint' => $subscriptionToFind->endpoint,
                    'p256dh' => $subscriptionToFind->keys->p256dh,
                    'auth' => $subscriptionToFind->keys->auth
                ]
            );

            $eventsIds = array();
            if ($subscription) {
                // Find subscribed events
                $events = $subscription->getEvents();

                // Get events' ids
                if ($events->count() > 0) {
                    foreach ($events as $event) {
                        $eventsIds[] = $event->getId();
                    }
                }
            }

            // Return response
            $response = new JsonResponse();
            $response->setData($eventsIds);
            return $response;

        }

        throw new Exception('Submmited data not valid');
    }

    /**
     * @Route("/set-events", name="set_events")
     * @Method("POST")
     * @param Request $request
     */
    public function setEventsAction(Request $request)
    {
        // Get POST content data
        $subscriptionDataToSave = json_decode($request->getContent());

        // Find subscription if POST data is OK
        if ($subscriptionDataToSave
            && isset($subscriptionDataToSave->events)
            && isset($subscriptionDataToSave->subscription)
            && isset($subscriptionDataToSave->subscription->endpoint)
            && isset($subscriptionDataToSave->subscription->keys->p256dh)
            && isset($subscriptionDataToSave->subscription->keys->auth)
        ) {
            $em = $this->getDoctrine()->getManager();
            $repository = $em->getRepository('AppBundle:Subscription');

            // Find a previous subscription...
            $subscription = $repository->findOneBy(
                [
                    'endpoint' => $subscriptionDataToSave->subscription->endpoint,
                    'p256dh' => $subscriptionDataToSave->subscription->keys->p256dh,
                    'auth' => $subscriptionDataToSave->subscription->keys->auth,
                ]
            );

            // ... or create a new one
            if (!$subscription) {
                $subscription = new Subscription();
                $subscription->setEndpoint($subscriptionDataToSave->subscription->endpoint);
                $subscription->setP256dh($subscriptionDataToSave->subscription->keys->p256dh);
                $subscription->setAuth($subscriptionDataToSave->subscription->keys->auth);
                $em->persist($subscription);
            }

            // Add events to subscription
            if ($subscription) {
                // Remove previous events
                $previousEvents = $subscription->getEvents();
                foreach ($previousEvents as $event) {
                    $subscription->removeEvent($event);
                }

                $eventsRepository = $em->getRepository('AppBundle:Event');
                $allEvents = $eventsRepository->findAll();
                foreach ($allEvents as $event) {
                    error_log($event->getId());
                    error_log(print_r($subscriptionDataToSave->events,1));
                    if (in_array($event->getId(), $subscriptionDataToSave->events)) {
                        $subscription->addEvent($event);
                    }
                }
                $em->flush();
            }

            // Return response
            $response = new JsonResponse();
            $response->setData(['result' => 1]);
            return $response;

        }

        throw new Exception('Submmited data not valid');
    }
}
