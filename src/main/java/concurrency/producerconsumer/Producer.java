package concurrency.producerconsumer;

import java.util.concurrent.BlockingQueue;

public class Producer extends Thread {

    private BlockingQueue<Data> queue;

    Producer(BlockingQueue<Data> bq) {
        this.queue = bq;
    }

    @Override
    public void run() {
        String[] datas = new String[] {"India", "USA", "UK", "Germany", "FRANCE","END"};
        try {
            for(String data: datas) {
                //System.out.println("Data to insert:"+data);
                queue.put(new Data(data));
                //System.out.println("Size:"+queue.size());
                Thread.sleep(1000);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
