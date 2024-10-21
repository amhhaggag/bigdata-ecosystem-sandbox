# Updates
## 2024-10-21
- Added the bes Command Line Interface for the Sandbox and it's documentation
- Update the bes-setup script:
    - removed the postgresql preparations and embedded the preparations in the docker image
    - removed the part that pull the images as it will be already pulled by default
- Removed the docker file and replaced building the hadoop and hive services by specifing the building requirements in the docker-compose file directly
