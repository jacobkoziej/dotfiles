_:

{
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      energy_performance_preference = "power";
      energy_perf_bias = "power";
      platform_profile = "low-power";
      turbo = "auto";
    };

    charger = {
      governor = "performance";
      energy_performance_preference = "performance";
      energy_perf_bias = "performance";
      platform_profile = "performance";
      turbo = "auto";
    };
  };
}
