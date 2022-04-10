package concurrency.producerconsumer;

import java.util.concurrent.BlockingQueue;

public class Consumer extends Thread {
    private BlockingQueue<Data> queue;

    Consumer(BlockingQueue<Data> bq) {
        this.queue = bq;
    }

    @Override
    public void run() {
        try {
            Data data = queue.take();
            while(!data.value().equals("END")) {
                System.out.println(data.value());
                data = queue.take();
                Thread.sleep(500);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
