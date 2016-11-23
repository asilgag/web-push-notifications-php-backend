<?php
namespace AppBundle\Command;

use Exception;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\ArrayInput;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;


class SendNotificationsCommand extends ContainerAwareCommand
{

    protected $notificationService;

    /**
     * Configuración inicial
     */
    protected function configure()
    {
        $this
            ->setName('wpn:send-notifications')
            ->setDescription('Send web push notifications');
    }


    /**
     * @param \Symfony\Component\Console\Input\InputInterface $input …
     * @param \Symfony\Component\Console\Output\OutputInterface $output …
     * @throws Exception
     * @return int|void
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $em = $this->getContainer()->get('doctrine')->getManager();
        $subscriptionRepository = $em->getRepository('AppBundle:Subscription');
        // $startDate = new \DateTime(date("Y-m-d H:i:00"));
        $startDate = new \DateTime('2016-11-25 10:00:00');
        $subscriptions = $subscriptionRepository->findByEventStartDate($startDate);

        $webPushNotificationService = $this->getContainer()->get('web_push_notification_service');
        foreach ($subscriptions as $subscription) {
            $output->write('Endpoint #' . $subscription->getId() . ' events: ');
            $events = $subscription->getEvents();
            foreach ($events as $event) {
                $output->write($event->getId() . ' ');
                $webPushNotificationService->sendNotification(
                    $subscription,
                    $event
                );
            }
            $output->writeln(' ');

        }

        return 0;
    }


}