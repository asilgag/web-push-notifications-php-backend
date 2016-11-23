<?php
namespace AppBundle\Entity;

use DateTime;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass="AppBundle\Repository\EventRepository")
 * @ORM\Table(name="event")
 */
class Event
{

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank()
     */
    protected $title;

    /**
     * @var DateTime
     * @ORM\Column(type="datetime")
     * @Assert\NotBlank()
     */
    protected $startDate;

    /**
     * @var string
     * @ORM\Column(type="string", length=255)
     */
    protected $venue;

    /**
     * @var string
     * @ORM\Column(type="string", length=255)
     */
    protected $speaker;

    /**
     * @var string
     * @ORM\Column(type="string", length=255)
     */
    protected $icon;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param string $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * @return DateTime
     */
    public function getStartDate()
    {
        return $this->startDate;
    }

    /**
     * @param DateTime $startDate
     */
    public function setStartDate($startDate)
    {
        $this->startDate = $startDate;
    }

    /**
     * @return string
     */
    public function getVenue()
    {
        return $this->venue;
    }

    /**
     * @param string $venue
     */
    public function setVenue($venue)
    {
        $this->venue = $venue;
    }

    /**
     * @return string
     */
    public function getSpeaker()
    {
        return $this->speaker;
    }

    /**
     * @param string $speaker
     */
    public function setSpeaker($speaker)
    {
        $this->speaker = $speaker;
    }

    /**
     * @return string
     */
    public function getIcon()
    {
        return $this->icon;
    }

    /**
     * @param string $icon
     */
    public function setIcon($icon)
    {
        $this->icon = $icon;
    }



}
