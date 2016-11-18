use Mix.Releases.Config,
    default_release: :default,
    default_environment: :dev

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"w+dzCQ)GFK-2@mV5K@s/JRFt/XeMvp?,Xup]RS3/Yd[%@WW,_ZwyHAO&AV22CSJt"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"w+dzCQ)GFK-2@mV5K@s/JRFt/XeMvp?,Xup]RS3/Yd[%@WW,_ZwyHAO&AV22CSJt"
end

release :meower do
  set version: current_version(:meower)
end

