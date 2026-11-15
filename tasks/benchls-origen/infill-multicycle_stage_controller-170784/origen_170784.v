module origen_170784(
    input clk,
    input resetn,
    input mem_inst,
    input send_inst,
    input UART_TE,
    input mem_force,
    output reg EXSTtoMEM_Wen,
    output reg IR_Wen,
    output reg PC_Wen,
    output reg PSR_Wen,
    output reg RF_Wen,
    output reg ST_Wen,
    output reg UART_load
);

    reg [1:0] curr_stage, next_stage;
    parameter IF = 2'b00, EXST = 2'b01, MEM = 2'b10, SEND = 2'b11;

    always @(posedge clk or negedge resetn) begin
        if (~resetn)
            curr_stage <= IF;
        else
            curr_stage <= next_stage;
    end

    always @(*) begin
        case (curr_stage)
            IF: next_stage = EXST;
            EXST:
                if (mem_inst)
                    next_stage = MEM;
                else if (send_inst)
                    next_stage = SEND;
                else
                    next_stage = IF;
            MEM:
                if (mem_force)
                    next_stage = EXST;
                else
                    next_stage = IF;
            SEND:
                if (UART_TE)
                    next_stage = IF;
                else
                    next_stage = SEND;
            default: next_stage = IF;
        endcase
    end

    [MASKED]

endmodule