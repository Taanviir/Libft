NAME 		= libft.a
C_FLAGS 	= -Wall -Wextra -Werror

SRC_PATH 	= sources
OBJ_PATH 	= objects
SUB_DIRS 	= ft_printf get_next_line is-utils linked-list memory-utils put-utils string-utils to-utils

SRCS_DIRS 	= $(foreach directory, $(SUB_DIRS), $(addprefix $(SRC_PATH)/, $(directory))) # adding the prefix sources/ to each subdirectory
OBJS_DIRS 	= $(foreach directory, $(SUB_DIRS), $(addprefix $(OBJ_PATH)/, $(directory))) # adding the prefix objects/ to each subdirectory
SRCS 		= $(foreach dir, $(SRCS_DIRS), $(wildcard $(dir)/*.c)) # collecting all .c files here
OBJS 		= $(subst $(SRC_PATH), $(OBJ_PATH), $(SRCS:.c=.o)) # changing .c to .o for object files

# colours
GREEN 			= "\033[1;32m"
RED 			= "\033[1;3;31m"
BLUE 			= "\033[3;34m"
YELLOW 			= "\033[0;33m"
COLOUR_RESET 	= "\033[0m"

$(OBJ_PATH)/%.o : $(SRC_PATH)/%.c
	@mkdir -p $(OBJ_PATH) $(OBJS_DIRS)
	@cc $(C_FLAGS) -I includes -c $< -o $@
	@echo $(YELLOW)"Compiling $< now"$(COLOUR_RESET)

all : $(NAME)

$(NAME) : $(OBJS)
	@echo $(GREEN)"Libft is ready ✅"$(COLOUR_RESET)
	@ar -rcs $(NAME) $^

clean :
	@rm -rf $(OBJS) $(OBJ_PATH)
	@echo $(RED)"\nRemoving object directory and files"$(COLOUR_RESET)

fclean : clean
	@rm -f $(NAME)
	@echo $(RED)"Removing $(NAME)\n"$(COLOUR_RESET)

re : fclean all

.PHONY = all clean fclean re