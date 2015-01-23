/*GENERIC file test*/
#include "../GENERIC-lib.h"
#include <glib.h>

void GENERIC_test (void) {

  //examples
  g_assert(0 == 0);
  g_assert_cmpint(1, ==, 1);
  g_assert_cmpstr("a", ==, "a");
  return;
}


int main(int argc, char *argv[])
{
  g_test_init(&argc, &argv, NULL);
  //tests go here

  g_test_add_func("/GENERIC-test", GENERIC_test);
     
  return g_test_run();
}

