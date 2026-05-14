# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pmorello <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/11 14:16:35 by pmorello          #+#    #+#              #
#    Updated: 2024/07/24 13:53:27 by pmorello         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= pipex
SRCS 	= srcs/pipex.c srcs/utils.c
OBJS 	= ${SRCS:.c=.o}
CC	= gcc
CFLAGS 	= -Wall -Wextra -Werror -Iincludes
RM 	= rm -rf

all: libft/libft.a ${NAME}

libft/libft.a:
	${MAKE} -C libft

%.o: %.c Makefile pipex.h
	${CC} ${CFLAGS} -c $< -o $@

${NAME}:${OBJS}
	${CC} ${CFLAGS} ${OBJS} -Llibft -lft -o ${NAME}					
clean:	
	${MAKE} -C libft fclean
	${RM} ${OBJS}

fclean: clean
	${RM} ${NAME}			

re:	fclean all

.PHONY: all clean fclean re
