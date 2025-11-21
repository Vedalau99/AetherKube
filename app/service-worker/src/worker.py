import time
import signal
import threading
from utils.logger import get_logger

logger = get_logger("service-worker")
running = True

def handle_signal(signum, frame):
    global running
    logger.info(f"Received signal {signum}. Shutting down gracefully...")
    running = False

# Handle K8s/Container termination
signal.signal(signal.SIGTERM, handle_signal)
signal.signal(signal.SIGINT, handle_signal)

def process_job():
    """
    Placeholder job function.
    Replace this with:
    - Queue processing
    - API calls
    - Scheduled tasks
    - ML inference
    """
    logger.info("Processing job...")
    time.sleep(2)  # simulate work
    logger.info("Job complete.")

def main():
    logger.info("Worker started and ready.")
    while running:
        process_job()
        time.sleep(3)  # polling interval

    logger.info("Worker stopped. Goodbye.")

if __name__ == "__main__":
    main()
