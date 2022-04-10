package unittesting;

import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import static org.mockito.Mockito.*;

public class CommandQueryTest {
    @Mock
    Dependency dependency;
    @InjectMocks
    Target target;

    @Test
    public void test() {
        Obj obj = new Obj();
        when(dependency.perform(obj, 7)).thenReturn(20);

        target.methodToTest(obj);

        // needed due to perform not being a pure function and it mutates Obj
        // pure functions won't need this
        verify(dependency, times(1)).perform(obj, 7);
    }
}
