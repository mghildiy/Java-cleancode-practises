package concurrency.producerconsumer;

public class Data {
    private String data;

    Data(String data) {
        this.data = data;
    }

    String value() {
        return data;
    }
}
