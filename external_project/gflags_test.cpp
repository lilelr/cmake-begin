#include <iostream>
#include <gflags/gflags.h>

using namespace std;

DEFINE_string(languages, "english,french,german","comma-separated list of languages to offer in the 'lang' menu");

int main(int argc, char *argv[])
{
    google::ParseCommandLineFlags(&argc, &argv, true);
    cout << FLAGS_languages << endl;
    return 0;
}
