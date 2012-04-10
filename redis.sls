redis:
  pkg:
    - installed
  service:
    - running
    - watch:
        # Restart redis whenever this changes
        - file: /etc/redis.conf

/etc/redis.conf:
  file:
    - managed
    - source: salt://compd/conf/redis.conf
    - user: root
    - group: root
    - mode: 644
    - require:
        - pkg: redis
