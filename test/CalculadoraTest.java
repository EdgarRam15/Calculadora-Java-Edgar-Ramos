import org.junit.Test;
import static org.junit.Assert.*;

public class CalculadoraTest {

    @Test
    public void testSuma() {
        Calculadora calc = new Calculadora();
        assertEquals(7, calc.sumar(3, 4));
    }

    @Test
    public void testDivisionPorCero() {
        Calculadora calc = new Calculadora();
        try {
            calc.dividir(5, 0);
            fail("Se esperaba una excepción por división entre cero");
        } catch (ArithmeticException e) {
            assertTrue(true);
        }
    }
}


