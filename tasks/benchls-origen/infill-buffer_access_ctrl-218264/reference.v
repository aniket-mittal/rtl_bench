module origen_218264 #(
    parameter BUF_NUM = 0,
    parameter BUF_SIZE = 256
)
(
    input           clk,
    input           rst,
    input   [31:0]  ctrl_word,
    input           go,
    output          done,
    output          error,
    output          idle,
    output          en_o,
    output          we_o,
    output  [9:0]   addr_o,
    input   [31:0]  dat_from_buf,
    output  [31:0]  dat_to_buf,
    input   [31:0]  wr_data_i,
    input   [7:0]   wr_flags_i,
    input           wr_ready_i,
    output          wr_ready_o,
    output  [31:0]  rd_data_o,
    output  [7:0]   rd_flags_o,
    output          rd_ready_o,
    input           rd_ready_i
);

    reg [31:0] ctrl_reg;
    reg [9:0] addr;
    reg [31:0] dat_to_buf_r;
    reg en_o_r, we_o_r;
    reg [2:0] state;
    reg done_r, error_r, idle_r;

    localparam IDLE = 3'd0;
    localparam PRE_READ = 3'd1;
    localparam READING = 3'd2;
    localparam WRITING = 3'd3;
    localparam ERROR = 3'd4;
    localparam DONE = 3'd5;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ctrl_reg <= 32'b0;
            addr <= 10'b0;
            dat_to_buf_r <= 32'b0;
            en_o_r <= 1'b0;
            we_o_r <= 1'b0;
            state <= IDLE;
            done_r <= 1'b0;
            error_r <= 1'b0;
            idle_r <= 1'b1;
        end else begin
            case (state)
                IDLE: begin
                    if (go && (ctrl_word[31:29] == BUF_NUM)) begin
                        ctrl_reg <= ctrl_word;
                        addr <= 10'b0;
                        state <= (ctrl_word[1:0] == 2'b01) ? PRE_READ : WRITING;
                        idle_r <= 1'b0;
                    end else begin
                        ctrl_reg <= ctrl_reg;
                        addr <= addr;
                        state <= IDLE;
                        idle_r <= 1'b1;
                    end
                end
                PRE_READ: begin
                    addr <= addr;
                    state <= READING;
                end
                READING: begin
                    if (rd_ready_i) begin
                        if (addr == (BUF_SIZE - 1)) begin
                            addr <= 10'b0;
                            state <= (ctrl_reg[1:0] == 2'b11) ? WRITING : DONE;
                        end else begin
                            addr <= addr + 1;
                            state <= READING;
                        end
                    end else begin
                        addr <= addr;
                        state <= READING;
                    end
                end
                WRITING: begin
                    if (wr_ready_i) begin
                        if (addr == (BUF_SIZE - 1)) begin
                            addr <= 10'b0;
                            state <= (ctrl_reg[1:0] == 2'b11) ? READING : DONE;
                        end else begin
                            addr <= addr + 1;
                            state <= WRITING;
                        end
                    end else begin
                        addr <= addr;
                        state <= WRITING;
                    end
                end
                ERROR: begin
                    addr <= addr;
                    state <= DONE;
                end
                DONE: begin
                    addr <= addr;
                    state <= IDLE;
                    done_r <= 1'b1;
                    error_r <= (state == ERROR) ? 1'b1 : 1'b0;
                    idle_r <= 1'b1;
                end
                default: begin
                    addr <= addr;
                    state <= IDLE;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            IDLE: begin
                en_o_r = 1'b0;
                we_o_r = 1'b0;
                dat_to_buf_r = 32'b0;
            end
            PRE_READ: begin
                en_o_r = 1'b1;
                we_o_r = 1'b0;
                dat_to_buf_r = 32'b0;
            end
            READING: begin
                en_o_r = 1'b1;
                we_o_r = 1'b0;
                dat_to_buf_r = dat_from_buf;
            end
            WRITING: begin
                en_o_r = 1'b1;
                we_o_r = 1'b1;
                dat_to_buf_r = wr_data_i;
            end
            ERROR: begin
                en_o_r = 1'b0;
                we_o_r = 1'b0;
                dat_to_buf_r = 32'b0;
            end
            DONE: begin
                en_o_r = 1'b0;
                we_o_r = 1'b0;
                dat_to_buf_r = 32'b0;
            end
            default: begin
                en_o_r = 1'b0;
                we_o_r = 1'b0;
                dat_to_buf_r = 32'b0;
            end
        endcase
    end

    assign en_o = en_o_r;
    assign we_o = we_o_r;
    assign addr_o = addr;
    assign dat_to_buf = dat_to_buf_r;
    assign done = done_r;
    assign error = error_r;
    assign idle = idle_r;
    assign wr_ready_o = (state == WRITING) ? 1'b1 : 1'b0;
    assign rd_data_o = dat_to_buf_r;
    assign rd_flags_o = (state == READING) ? wr_flags_i : 8'b0;
    assign rd_ready_o = (state == READING) ? 1'b1 : 1'b0;

endmodule