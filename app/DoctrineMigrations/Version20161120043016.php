<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20161120043016 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE subscription (id INT AUTO_INCREMENT NOT NULL, endpoint VARCHAR(255) NOT NULL, p256dh VARCHAR(255) NOT NULL, auth VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_A3C664D3C4420F7B (endpoint), UNIQUE INDEX UNIQ_A3C664D3C4EA91FC (p256dh), UNIQUE INDEX UNIQ_A3C664D3F8DEB059 (auth), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE subscription_event (subscription_id INT NOT NULL, group_id INT NOT NULL, INDEX IDX_C1960BD49A1887DC (subscription_id), INDEX IDX_C1960BD4FE54D947 (group_id), PRIMARY KEY(subscription_id, group_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE event (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, start_date DATETIME NOT NULL, venue VARCHAR(255) NOT NULL, speaker VARCHAR(255) NOT NULL, icon VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE subscription_event ADD CONSTRAINT FK_C1960BD49A1887DC FOREIGN KEY (subscription_id) REFERENCES subscription (id)');
        $this->addSql('ALTER TABLE subscription_event ADD CONSTRAINT FK_C1960BD4FE54D947 FOREIGN KEY (group_id) REFERENCES event (id)');
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE subscription_event DROP FOREIGN KEY FK_C1960BD49A1887DC');
        $this->addSql('ALTER TABLE subscription_event DROP FOREIGN KEY FK_C1960BD4FE54D947');
        $this->addSql('DROP TABLE subscription');
        $this->addSql('DROP TABLE subscription_event');
        $this->addSql('DROP TABLE event');
    }
}
