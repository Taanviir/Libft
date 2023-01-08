NAME 		= libft.a
C_FLAGS 	= -Wall -Wextra -Werror

SRC_PATH 	= sources
OBJ_PATH 	= objects
SUB_DIRS 	= ft_printf get_next_line is-utils linked-list memory-utils put-utils string-utils to-utils

SRCS_DIRS 	= $(foreach directory, $(SUB_DIRS), $(addprefix $(SRC_PATH)/, $(directory))) # adding the prefix sources/ to each subdirectory
OBJS_DIRS 	= $(foreach directory, $(SUB_DIRS), $(addprefix $(OBJ_PATH)/, $(directory))) # adding the prefix objects/ to each subdirectory

SRCS 		= ft_print_char.c ft_print_hex.c ft_print_number.c ft_print_pointer.c ft_print_string.c ft_print_unsigned.c ft_printf.c ft_support.c get_next_line.c \
			ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c ft_lstiter.c ft_lstlast.c \
			ft_lstmap.c ft_lstnew.c ft_lstsize.c ft_bzero.c ft_calloc.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c \
			ft_putnbr_fd.c ft_putstr_fd.c ft_split.c ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c \
			ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_atoi.c ft_itoa.c ft_tolower.c ft_toupper.c

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