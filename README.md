# jMeter server chef cookbook

## This is tested using the chef-dk 3.1.0

```bash
chef --version

Chef Development Kit Version: 3.1.0
chef-client version: 14.2.0
delivery version: master (6862f27aba89109a9630f0b6c6798efec56b4efe)
berks version: 7.0.4
kitchen version: 1.22.0
inspec version: 2.1.72
```

## How to configure in OpsWorks

### Under new stack

- Use chef 12 and add github link to `Repository URL`
- Layers --> Recipes --> Setup: `jmeter::default, jmeter::install_java, jmeter::install_jmeter, jmeter::install_phantomjs`

### How to run scripts

- Stack --> Run Command

  - Command: `Execute Recipes`
  - Recipes to execute: `jmeter::run_script`
  - Click `Advance`
  - Custom Chef JSON:

    ```javascript
    { "jmeter" : { "script" : "http://sample-domain.com/path/to/you/jmeter.jmx" } }
    ```

## How to test using `kitchen`

- Modify `.kitchen.yml` and provide the correct path to the `javascript { "jmeter": { "script": "" } }`
- Run the script
  - ```bash
    chef exec kitchen converge
    ```
