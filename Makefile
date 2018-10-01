.PHONY: publish-mahout
publish-mahout:
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.13.0 hadoop_version=3.1.1
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.13.0 hadoop_version=3.1.1
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.13.0 hadoop_version=3.0.3
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.13.0 hadoop_version=3.0.3
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.13.0 hadoop_version=3.0.2
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.13.0 hadoop_version=3.0.2
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.13.0 hadoop_version=2.9.1
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.13.0 hadoop_version=2.9.1
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.13.0 hadoop_version=2.9.0
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.13.0 hadoop_version=2.9.0
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.13.0 hadoop_version=2.8.4
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.13.0 hadoop_version=2.8.4
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.13.0 hadoop_version=2.7.6
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.13.0 hadoop_version=2.7.6
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.13.0 hadoop_version=2.6.5
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.13.0 hadoop_version=2.6.5
# ----------------------------------------------------------------------------------------------------------------------
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.12.2 hadoop_version=3.1.1
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.12.2 hadoop_version=3.1.1
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.12.2 hadoop_version=3.0.3
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.12.2 hadoop_version=3.0.3
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.12.2 hadoop_version=3.0.2
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.12.2 hadoop_version=3.0.2
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.12.2 hadoop_version=2.9.1
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.12.2 hadoop_version=2.9.1
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.12.2 hadoop_version=2.9.0
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.12.2 hadoop_version=2.9.0
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.12.2 hadoop_version=2.8.4
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.12.2 hadoop_version=2.8.4
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.12.2 hadoop_version=2.7.6
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.12.2 hadoop_version=2.7.6
	$(MAKE) publish-mahout-helper dist=ubuntu mahout_version=0.12.2 hadoop_version=2.6.5
	$(MAKE) publish-mahout-helper dist=alpine mahout_version=0.12.2 hadoop_version=2.6.5

.PHONY: publish-mahout-helper
publish-mahout-helper:
	sudo docker build -q -t mpolatcan/mahout:$(dist)-$(mahout_version)-hadoop-$(hadoop_version) --build-arg MAHOUT_VERSION=$(mahout_version) --build-arg HADOOP_VERSION=$(hadoop_version) ./$(dist)/
	sudo docker push mpolatcan/mahout:$(dist)-$(mahout_version)-hadoop-$(hadoop_version)
	sudo docker rmi $$(sudo docker images -q)