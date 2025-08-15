#lang racket

(define (password-valid? pw)
  (let [(char-alphanumeric?
         (lambda (c)
           (or
            (char-alphabetic? c)
            (char-numeric? c))))]
   (and
    (andmap char-alphanumeric? (string->list pw))
    (> (string-length pw) 0))))

(define (password-good? pw)
   (and
    (ormap char-alphabetic? (string->list pw))
    (ormap char-numeric? (string->list pw))
    (>= (string-length pw) 8)))

(define (scroll-left str)
  (if (> (string-length str) 0)
      (string-append
       (substring str 1)
       (string (string-ref str 0)))
      ""))

(define (add a b)
  (let*
      [(sum (+ a b))
       (width (string-length (number->string sum)))]
    (string-append
     (format
      "+~a~n"
      (~a
       a
       #:min-width width
       #:align 'right))
     (format
      "~a~n"
      (~a
       b
       #:min-width (add1 width)
       #:align 'right))
     (format
      " ~a~n"
      (~a
       (make-string
        width
        #\-)
       #:min-width width
       #:align 'right))
     (format
      " ~a"
      (~a
       sum
       #:min-width width
       #:align 'right)))))

(define (add-elegant a b)
  (let* [(sum (~a (+ a b)))
         (width (string-length sum))]
    (format
     "+~a~n ~a~n ~a~n ~a"
     (~a a
         #:min-width width
         #:align 'right)
     (~a b
         #:min-width width
         #:align 'right)
     (make-string width #\-)
     sum)))

(define err1
  "{\"summary\": \"deploy_callback_context: FailedTask(AssertionError('Action install finished with unexpected result - 'failed'. Expected - 'success'\ntask [diamond : Install Diamond] ***********************************************\nThursday 03 July 2025  09:43:07 +0000 (0:00:00.065)       0:22:48.420 ********* \nFAILED - RETRYING: Install Diamond (3 retries left).\nFAILED - RETRYING: Install Diamond (2 retries left).\nFAILED - RETRYING: Install Diamond (1 retries left).\nfatal: [adm-1.localhost]: FAILED! => changed=false \n  attempts: 3\n  cache_update_time: 1751535785\n  cache_updated: false\n  msg: |-\n    '/usr/bin/apt-get -y -o \"Dpkg::Options::=--force-confdef\" -o \"Dpkg::Options::=--force-confold\"      install 'diamond=4.0.515-arenadata1-138'' failed: E: Can't find a source to download version '4.0.515-arenadata1-138' of 'diamond:amd64'\n  rc: 100\n  stderr: |-\n    E: Can't find a source to download version '4.0.515-arenadata1-138' of 'diamond:amd64'\n  stderr_lines: <omitted>\n  stdout: |-\n    Reading package lists...\n    Building dependency tree...\n    Reading state information...\n    The following packages were automatically installed and are no longer required:\n      docker-buildx-plugin docker-ce-rootless-extras docker-compose-plugin\n      etcd-client etcd-server gdal-data libaec0 libarmadillo10 libarpack2 libblas3\n      libblosc1 libboost-serialization1.74.0 libcfitsio9 libcharls2\n      libcommon-sense-perl libfreexl1 libfyba0 libgdal30 libgeos-c1v5\n      libgeos3.10.2 libgeotiff5 libgfortran5 libgif7 libgmpxx4ldbl libhdf4-0-alt\n      libhdf5-103-1 libhdf5-hl-100 libjson-perl libjson-xs-perl libkmlbase1\n      libkmldom1 libkmlengine1 liblapack3 libllvm14 libminizip1 libmysqlclient21\n      libnetcdf19 libodbc2 libodbcinst2 libogdi4.1 libpoppler118 libpq5 libproj22\n      libprotobuf-c1 libqhull-r8.0 libquadmath0 librttopo1 libsensors-config\n      libsensors5 libsfcgal1 libslirp0 libsnappy1v5 libspatialite7 libsuperlu5\n      libsz2 libtypes-serialiser-perl liburiparser1 libxerces-c3.2 mysql-common\n      pipexec postgis-doc proj-bin proj-data slirp4netns ssl-cert sysstat\n      unixodbc-common\n    Use 'sudo apt autoremove' to remove them.\n    The following additional packages will be installed:\n      python-pkg-resources python2 python2-minimal python2.7 python2.7-minimal\n    Suggested packages:\n      python-setuptools python2-doc python-tk python2.7-doc binfmt-support\n  stdout_lines: <omitted>'))\", \"state\": \"DEPLOY_STATE_ERROR\", \"cloud_cp_info\": {\"message_type\": null, \"arenadata_instance_id\": \"673aa4b1-4372-4e7a-9211-70b400c5d01a\", \"vm_cluster_id\": null}}")


(define err2
  "  File \"/usr/local/lib/python3.11/site-packages/temporalio/worker/_activity.py\", line 301, in _handle_start_activity_task\n    result = await self._execute_activity(start, running_activity, task_token)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n  File \"/usr/local/lib/python3.11/site-packages/temporalio/worker/_activity.py\", line 590, in _execute_activity\n    return await impl.execute_activity(input)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n  File \"/usr/local/lib/python3.11/site-packages/temporalio/worker/_activity.py\", line 785, in execute_activity\n    return await input.fn(*input.args)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n  File \"/usr/local/lib/python3.11/site-packages/arenadata_common/base/logging/decorators.py\", line 41, in wrapper\n    result = await func(*args, **kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n  File \"/code/arenadata_iaas_gateway_api/server/controllers/activities/host_config_activity.py\", line 38, in check_host_config_request\n    await self.deploy_orchestrator.check_host_config_request(vm_cluster_data_model=vm_cluster_data_model)\n\n  File \"/usr/local/lib/python3.11/site-packages/arenadata_common/base/logging/decorators.py\", line 41, in wrapper\n    result = await func(*args, **kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n  File \"/code/arenadata_iaas_gateway_api/business_logic/orchestrators/internal/deploy_orchestrator.py\", line 144, in check_host_config_request\n    if not ArenadataVmsConfig.validate(vm_cluster.arenadata_vms_configuration):\n           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n  File \"pydantic/main.py\", line 717, in pydantic.main.BaseModel.validate\n\n  File \"pydantic/main.py\", line 347, in pydantic.main.BaseModel.__init__\n")

(displayln err2)
