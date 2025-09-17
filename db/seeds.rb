# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Services seed (safe to re-run)
services = [
  {
    title: "Cyber Security",
    description: "Advanced protection to safeguard your data, networks, and digital assets. Stay secure with proactive monitoring, threat detection, and rapid response.",
    icon_style: "fas",   # Font Awesome Solid
    icon_name:  "shield-alt"
  },
  {
    title: "Firewall",
    description: "Advanced firewall protection to secure your infrastructure from cyber threats, intrusions, and data breaches.",
    icon_style: "fas",
    icon_name:  "chart-pie" # matches your current markup; swap to "shield-alt" if you prefer
  },
  {
    title: "Power Backup (UPS for Network Equipment)",
    description: "Reliable power backup to protect your critical IT and networking gear. Our UPS systems ensure continuous uptime during outages or voltage fluctuations.",
    icon_style: "fas",
    icon_name:  "plug" # alternatives: "battery-full", "bolt"
  },
  {
    title: "Routers/Switches",
    description: "High-speed routers and switches designed for stable, efficient network traffic management in any environment.",
    icon_style: "fas",
    icon_name:  "network-wired" # nice fit for networking hardware
  },
  {
    title: "IP Surveillance Systems",
    description: "Smart surveillance with IP cameras, NVRs, and remote monitoring. Protect your premises with HD video, motion alerts, and secure storage.",
    icon_style: "fas",
    icon_name:  "video" # alternatives: "camera", "video-camera"
  }
]

services.each do |attrs|
  s = Service.find_or_initialize_by(title: attrs[:title])
  s.assign_attributes(attrs)
  s.save!
end

puts "Seeded #{Service.count} services."
