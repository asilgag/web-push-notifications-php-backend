<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Subscription
 *
 * @ORM\Table(name="subscription")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\SubscriptionRepository")
 */
class Subscription
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="endpoint", type="string", length=255, unique=true)
     */
    private $endpoint;

    /**
     * @var string
     *
     * @ORM\Column(name="p256dh", type="string", length=255, unique=true)
     */
    private $p256dh;

    /**
     * @var string
     *
     * @ORM\Column(name="auth", type="string", length=255, unique=true)
     */
    private $auth;

    /**
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Event")
     * @ORM\JoinTable(name="subscription_event",
     *      joinColumns={@ORM\JoinColumn(name="subscription_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="group_id", referencedColumnName="id")}
     *      )
     */
    private $events;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->events = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set endpoint
     *
     * @param string $endpoint
     *
     * @return Subscription
     */
    public function setEndpoint($endpoint)
    {
        $this->endpoint = $endpoint;

        return $this;
    }

    /**
     * Get endpoint
     *
     * @return string
     */
    public function getEndpoint()
    {
        return $this->endpoint;
    }

    /**
     * Set p256dh
     *
     * @param string $p256dh
     *
     * @return Subscription
     */
    public function setP256dh($p256dh)
    {
        $this->p256dh = $p256dh;

        return $this;
    }

    /**
     * Get p256dh
     *
     * @return string
     */
    public function getP256dh()
    {
        return $this->p256dh;
    }

    /**
     * Set auth
     *
     * @param string $auth
     *
     * @return Subscription
     */
    public function setAuth($auth)
    {
        $this->auth = $auth;

        return $this;
    }

    /**
     * Get auth
     *
     * @return string
     */
    public function getAuth()
    {
        return $this->auth;
    }

    /**
     * Add event
     *
     * @param \AppBundle\Entity\Event $event
     *
     * @return Subscription
     */
    public function addEvent(\AppBundle\Entity\Event $event)
    {
        $this->events[] = $event;

        return $this;
    }

    /**
     * Remove event
     *
     * @param \AppBundle\Entity\Event $event
     */
    public function removeEvent(\AppBundle\Entity\Event $event)
    {
        $this->events->removeElement($event);
    }

    /**
     * Get events
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEvents()
    {
        return $this->events;
    }
}
