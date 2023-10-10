#makeshift
import argparse

if __name__ == '__main__':
  parser = argparse.ArgumentParser()

  # Required parameters
  parser.add_argument(
    "--data_dir",
    default=None,
    type=str,
    required=True,
    help="The input data dir. Should contain the training files for the few_nerd task.",
  )

  args = parser.parse_args()

  directories = [f'{args.data_dir}/few-nerd/inter/train.txt', f'{args.data_dir}/few-nerd/intra/train.txt']

  for file1 in directories:
    final_str = ""
    with open(file1, 'r') as f:
      lines = f.readlines()
      for line in lines:
        cmpnnts = line.split('\t')
        if len(cmpnnts) < 2:
          final_str += line
          continue
        c1, c2 = cmpnnts
        c1 = c1.lower()
        final_str += (c1 + '\t' + c2 )

    f = open(file1, 'w')
    f.write(final_str)
    f.close()