module origen_174222 (
    input op_clear,
    input wr_en,
    input rd_en,
    input [2:0] state,
    input [3:0] data_count,
    output reg [2:0] next_state
);

localparam INIT     = 3'b000;
localparam NO_OP    = 3'b001;
localparam WRITE    = 3'b010;
localparam WR_ERROR = 3'b011;
localparam READ     = 3'b100;
localparam RD_ERROR = 3'b101;

always @(*) begin
    case (state)
        INIT: begin
            next_state = INIT;
            if (op_clear)
                next_state = INIT;
        end
        NO_OP: begin
            next_state = NO_OP;
            if (op_clear)
                next_state = INIT;
            else if (wr_en && rd_en)
                next_state = NO_OP;
            else if (wr_en)
                next_state = (data_count == 4'd8) ? WR_ERROR : WRITE;
            else if (rd_en)
                next_state = (data_count == 4'd0) ? RD_ERROR : READ;
            else
                next_state = NO_OP;
        end
        WRITE: begin
            next_state = WRITE;
            if (op_clear)
                next_state = INIT;
            else if (wr_en && rd_en)
                next_state = NO_OP;
            else if (wr_en)
                next_state = (data_count == 4'd8) ? WR_ERROR : WRITE;
            else if (rd_en)
                next_state = (data_count == 4'd0) ? RD_ERROR : READ;
            else
                next_state = NO_OP;
        end
        WR_ERROR: begin
            next_state = WR_ERROR;
            if (op_clear)
                next_state = INIT;
            else if (wr_en && rd_en)
                next_state = NO_OP;
            else if (wr_en)
                next_state = WR_ERROR;
            else if (rd_en)
                next_state = (data_count == 4'd0) ? RD_ERROR : READ;
            else
                next_state = NO_OP;
        end
        READ: begin
            next_state = READ;
            if (op_clear)
                next_state = INIT;
            else if (wr_en && rd_en)
                next_state = NO_OP;
            else if (wr_en)
                next_state = (data_count == 4'd8) ? WR_ERROR : WRITE;
            else if (rd_en)
                next_state = (data_count == 4'd0) ? RD_ERROR : READ;
            else
                next_state = NO_OP;
        end
        RD_ERROR: begin
            next_state = RD_ERROR;
            if (op_clear)
                next_state = INIT;
            else if (wr_en && rd_en)
                next_state = NO_OP;
            else if (wr_en)
                next_state = (data_count == 4'd8) ? WR_ERROR : WRITE;
            else if (rd_en)
                next_state = RD_ERROR;
            else
                next_state = NO_OP;
        end
        default: begin
            next_state = INIT;
        end
    endcase
end

endmodule