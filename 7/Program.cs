using System.Text;

int result = 0;
List<int> indices = new List<int>();
List<int> indices_nl = new List<int>();

using (var fileStream = File.OpenRead("./input"))
    using (var streamReader = new StreamReader(fileStream, Encoding.UTF8, true, 128))
    {
        var line = streamReader.ReadLine();
        indices.Add(line.IndexOf('S'));

        while ((line = streamReader.ReadLine()) != null)
        {
            foreach (int i in indices)
            {
                if (line[i] == '.')
                    if (!indices_nl.Contains(i))
                        indices_nl.Add(i);

                if (line[i] == '^')
                {
                    result++;
                    if (!indices_nl.Contains(i - 1))
                        indices_nl.Add(i - 1);
                    if (!indices_nl.Contains(i + 1))
                        indices_nl.Add(i + 1);
                }
            }

            indices.Clear();
            indices.InsertRange(0, indices_nl);
            indices_nl.Clear();
        }
    }

Console.WriteLine(result);
