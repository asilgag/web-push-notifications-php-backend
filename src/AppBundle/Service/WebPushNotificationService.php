<?php

namespace AppBundle\Service;

use AppBundle\Entity\Event;
use AppBundle\Entity\Subscription;
use Doctrine\ORM\EntityManager;
use Minishlink\WebPush\WebPush;
use Symfony\Bundle\FrameworkBundle\Routing\Router;
use Symfony\Bundle\TwigBundle\TwigEngine;
use Symfony\Component\HttpKernel\Kernel;

/**
 * WebPushNotificationService.
 */
class WebPushNotificationService
{
    /**
     * @var \Doctrine\ORM\EntityManager
     */
    protected $em;
    protected $webPushService;
    protected $subscriptionRepository;
    protected $eventRepository;

    /**
     * Create the WebPushNotificationService service.
     *
     * @param \Doctrine\ORM\EntityManager $em
     */
    public function __construct(EntityManager $em, WebPush $webPushService)
    {
        $this->em = $em;
        $this->webPushService = $webPushService;
        $this->subscriptionRepository = $this->em->getRepository('AppBundle:Subscription');
        $this->eventRepository = $this->em->getRepository('AppBundle:Event');
    }


    /**
     * @param Subscription $subscription
     * @param Event $event
     * @return array|bool
     */
    public function sendNotification(Subscription $subscription, Event $event)
    {
        $speaker = $event->getSpeaker();
        $venue = $event->getVenue();
        $body = 'A las ' . $event->getStartDate()->format('H:i') . 'h';
        if ($speaker && $venue) {
            $body .= ', ' . $venue . '. Por '. $speaker;
        }
        $payload = [
            'title' => $event->getTitle(),
            'config' => [
                'body' => $body,
                'icon' => $event->getIcon() ? : '/images/app-shell/master-icon.png',
                'badge' => '/images/touch/android-chrome-192x192.png'
                // 'badge' => $event->getIcon() ? : '/images/app-shell/master-icon.png'
            ]
        ];

        $this->webPushService->sendNotification(
            $subscription->getEndpoint(),
            json_encode($payload),
            $subscription->getP256dh(),
            $subscription->getAuth()
        );

        $res = $this->webPushService->flush();

        return $res;
    }


}
