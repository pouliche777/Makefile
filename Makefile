S = src/
O = obj/

SOURCES = $Spush_swap.c \
	$Soperations.c \
	$Soperations_1.c \
	$Soutils_tri.c \
	$Spremier_sort.c \
	$Schaines_utils.c \
	$Svalidation.c

OBJS = $(SOURCES:$S%=$O%.o)

CC = gcc
RM = rm -f
RMDIR = rmdir
CFLAGS = -Wall -Wextra -Werror

NAME = push_swap

all: $(NAME)


$O:
	@mkdir $@

$(OBJS): | $O


$(OBJS): $O%.o: $S%
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) $^ -o $@
	@echo "\033[0;32m Compilation complétée"

clean: 
	@$(RM) $(OBJS)
	@$(RMDIR) $O
	@echo "\033[0;31m Fichiers .o suprimes"

fclean:	clean

	@$(RM) $(NAME)
	@echo "\033[0;31m executable suprime"


re:	fclean $(NAME)
