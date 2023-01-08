NAME 		= libft.a
C_FLAGS 	= -Wall -Wextra -Werror

SRC_PATH 	= sources
OBJ_PATH 	= objects
SUB_DIRS 	= ft_printf get_next_line is-utils linked-list memory-utils put-utils string-utils to-utils

SRCS_DIRS 	= $(foreach directory, $(SUB_DIRS), $(addprefix $(SRC_PATH)/, $(directory))) # adding the prefix sources/ to each subdirectory
OBJS_DIRS 	= $(foreach directory, $(SUB_DIRS), $(addprefix $(OBJ_PATH)/, $(directory))) # adding the prefix objects/ to each subdirectory
SRCS 		= $(foreach dir, $(SRCS_DIRS), $(wildcard $(dir)/*.c)) # collecting all .c files here
OBJS 		= $(subst $(SRC_PATH), $(OBJ_PATH), $(SRCS:.c=.o)) # changing .c to .o for object files

$(OBJ_PATH)/%.o : $(SRC_PATH)/%.c
	@mkdir -p $(OBJ_PATH) $(OBJS_DIRS)
	@cc $(C_FLAGS) -I includes -c $< -o $@
	@echo "Compiling $< now"

all : $(NAME)

$(NAME) : $(OBJS)
	@ar -rcs $(NAME) $^

clean :
	@rm -rf $(OBJS) $(OBJ_PATH)
	@echo "Removing object directory and files"

fclean : clean
	@rm -f $(NAME)
	@echo "Removing $(NAME)"

re : fclean all

.PHONY = all clean fclean re