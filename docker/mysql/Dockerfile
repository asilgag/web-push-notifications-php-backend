FROM mysql:latest

# Speed optimizations for development (do not use this on production!!!)
RUN echo "innodb_flush_log_at_trx_commit=0" >> /etc/mysql/mysql.conf.d/mysqld.cnf
RUN echo "innodb_file_per_table=OFF" >> /etc/mysql/mysql.conf.d/mysqld.cnf


