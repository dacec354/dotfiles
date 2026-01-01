# claude code with different model
fn claude {|@args|
  var platforms = [
    &deepseek= [
      &name= DeepSeek
      &base_url= https://api.deepseek.com/anthropic
      &env_key= DEEPSEEK_API_KEY
      &model= deepseek-chat
      &small_model= deepseek-chat
    ]
    &moonshot=[
      &name= MoonShot
      &base_url= https://api.moonshot.cn/anthropic
      &env_key= MOONSHOT_API_KEY
      &model= kimi-k2-0905-preview
      &small_model= kimi-k2-0905-preview
    ]
    &claude= [
      &name= "Claude Mirro"
      &base_url= https://code.aitianhu5.top/openai
      &env_key= ANTHROPIC_AUTH_TOKEN
    ]
  ]

  # Default to DeepSeek if no platform specified
  var selected_platform = deepseek
  if (count $args | > (one) 0) {
    set selected_platform = $args[0]
  }

  if (not (has-key $platforms $selected_platform)) {
    echo "Error: Unknown platform '"$selected_platform"'"
    echo "Available platforms: "(keys $platforms | str:join ", ")
    return
  }

  var config = $platforms[$selected_platform]
  var env_key = $config[env_key]

  if (not (has-env $env_key)) {
    echo "Error: "$env_key" is not set"
    echo "Please set your API key by adding the following line to this file:"
    echo "set-env "$env_key" \"your-actual-api-key-here\""
    return 1
  }

  echo "Starting Claude Code with "$config[name]"..."
  set-env ANTHROPIC_BASE_URL $config[base_url]
  set-env ANTHROPIC_AUTH_TOKEN (get-env $env_key)
  set-env ANTHROPIC_MODEL $config[model]
  set-env ANTHROPIC_SMALL_FAST_MODEL $config[small_model]
  
  # Launch Claude Code
  var remainings = $args[1..]
  e:claude $@remainings
}

# qwen coder with different model
fn qwen {|@args|
  var platforms = [
    &deepseek= [
      &name= DeepSeek
      &base_url= https://api.deepseek.com
      &env_key= DEEPSEEK_API_KEY
      &model= deepseek-chat
    ]
    &moonshot=[
      &name= MoonShot
      &base_url= https://api.moonshot.cn/v1
      &env_key= MOONSHOT_API_KEY
      &model= kimi-k2-0905-preview
    ]
  ]

  # Default to DeepSeek if no platform specified
  var selected_platform = deepseek
  if (count $args | > (one) 0) {
    set selected_platform = $args[0]
  }

  if (not (has-key $platforms $selected_platform)) {
    echo "Error: Unknown platform '"$selected_platform"'"
    echo "Available platforms: "(keys $platforms)
    echo "Available platforms: "(keys $platforms | str:join ", ")
    return
  }

  var config = $platforms[$selected_platform]
  var env_key = $config[env_key]

  if (not (has-env $env_key)) {
    echo "Error: "$env_key" is not set"
    echo "Please set your API key by adding the following line to this file:"
    echo "set-env "$env_key" \"your-actual-api-key-here\""
    return 1
  }

  echo "Starting Qwen Code Cli with "$config[name]"..."
  set-env OPENAI_BASE_URL $config[base_url]
  set-env OPENAI_API_KEY (get-env $env_key)
  set-env OPENAI_MODEL $config[model]

  # Launch Claude Code
  var remainings = $args[1..]
  e:qwen $@remainings
}
