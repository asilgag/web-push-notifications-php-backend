<?php
namespace AppBundle\EventListener;

use Symfony\Component\HttpKernel\Event\FilterResponseEvent;

class HeaderListener
{
    public function onKernelResponse(FilterResponseEvent $event)
    {
        // Add CORS header
        $response = $event->getResponse();
        $response->headers->set('Access-Control-Allow-Origin', '*');
    }
}