import yaml
class Config:
    def __init__(self, config_path: str="./config.yaml"):
        with open(config_path, 'r') as f:
            config = yaml.safe_load(f)
            for key, value in config.items():
                setattr(self, key, value)
    
    def get_yosys_batch_dir(self) -> str:
        """Get the Yosys batch directory path."""
        return self.batch_dir_path
    
    def get_debug_settings(self) -> tuple[bool, str]:
        """Get debug settings as a tuple."""
        return self.debug_enabled, self.debug_log_file