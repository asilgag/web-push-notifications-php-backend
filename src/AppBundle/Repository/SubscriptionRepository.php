<?php

namespace AppBundle\Repository;

/**
 * SubscriptionRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class SubscriptionRepository extends \Doctrine\ORM\EntityRepository
{
    public function findByEventStartDate(\DateTime $startDate)
    {
        return $this->getEntityManager()
            ->createQueryBuilder()
            ->select('s')
            ->addSelect('e')
            ->from('AppBundle:Subscription', 's')
            ->leftJoin('s.events','e')
            ->where('e.startDate = :start_date')
            ->setParameter('start_date', $startDate)
            ->getQuery()
            ->getResult();
            //->getResult(\Doctrine\ORM\Query::HYDRATE_SCALAR);

    }
}
