/MicroFixProject
│
├── main.mfix              # Main entry + compiler hooks
├── guild_chain.mfix       # Guild sync rules + fallback
├── sensors.logic.mfix     # Sensor validation stream
├── runtime_call.cel       # Celarion runtime trigger mapping
├── modules/
│   ├── sensorproof.mfix   # Real proof logic for simulated sensors
│   └── streamlogic.mfix   # StreamNode real-logic processing
└── utils/
    └── hexlib.mfix        # FHex calculation and range validation
