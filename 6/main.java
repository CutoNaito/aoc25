import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

class Problems {
    ArrayList<Integer> numbers;
    char operator;

    public void setOperator(char c) {
        this.operator = c;
    }

    public void addNumber(int n) {
        this.numbers.add(n);
    }

    public char getOperator() {
        return this.operator;
    }

    public ArrayList<Integer> getNumbers() {
        return this.numbers;
    }

    public Problems(int initial) {
        numbers = new ArrayList<Integer>();
        numbers.add(initial);
        operator = 'x';
    }
}

public class main {
    public static long part1() {
        ArrayList<Problems> problems = new ArrayList<Problems>();
        long result = 0;
        
        try (BufferedReader br = new BufferedReader(new FileReader("./input"))) {
            String line = br.readLine();
            String[] line_s = line.trim().split("\\s+");

            for (int i = 0; i < line_s.length; i++) {
                problems.add(new Problems(Integer.parseInt(line_s[i])));
            }

            while ((line = br.readLine()) != null) {
                line_s = line.trim().split("\\s+");

                for (int i = 0; i < line_s.length; i++) {
                    if (Character.isDigit(line_s[i].charAt(0))) {
                        problems.get(i).addNumber(Integer.parseInt(line_s[i]));
                    } else {
                        problems.get(i).setOperator(line_s[i].charAt(0));
                    }
                }
            }

            for (int i = 0; i < problems.size(); i++) {
                long result_problem = problems.get(i).getNumbers().get(0);

                for (int j = 1; j < problems.get(i).getNumbers().size(); j++) {
                    switch (problems.get(i).getOperator()) {
                        case ('+'):
                            result_problem += problems.get(i).getNumbers().get(j);
                            break;

                        case ('*'):
                            result_problem *= problems.get(i).getNumbers().get(j);
                            break;
                    }
                }

                result += result_problem;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }

    public static void main(String[] args) {
        System.out.println(part1());
    }
}
