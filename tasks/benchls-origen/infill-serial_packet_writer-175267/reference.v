module origen_175267 (
    input  wire        mclk_i,
    input  wire [15:0] sernum_i,
    input  wire [31:0] count_i,
    input  wire        write_strobe_i,
    input  wire        fifo_full_i,
    output reg  [7:0]  fifo_in_o,
    output reg         fifo_write_strobe_o,
    output reg         busy_o
);

    reg [31:0] local_count;
    reg [15:0] local_sernum;
    reg        last_write_strobe;
    reg  [3:0] state;
    reg  [3:0] post_strobe_state;
    reg  [3:0] fifo_write_strobe_count;

    localparam [3:0] IDLE          = 4'b0000,
                     CAPTURE_INPUT = 4'b0001,
                     WRITE_HEADER  = 4'b0010,
                     WRITE_SERNUM   = 4'b0011,
                     WRITE_SERNUM_2 = 4'b0100,
                     WRITE_COUNT    = 4'b0101,
                     WRITE_COUNT_2  = 4'b0110,
                     WRITE_COUNT_3  = 4'b0111,
                     WRITE_COUNT_4  = 4'b1000,
                     COMPLETE       = 4'b1001;

    always @(posedge mclk_i) begin
        last_write_strobe <= write_strobe_i;

        case (state)
            IDLE: begin
                busy_o <= 1'b0;
                fifo_write_strobe_o <= 1'b0;
                if (write_strobe_i & ~last_write_strobe) begin
                    local_count <= count_i;
                    local_sernum <= sernum_i;
                    state <= CAPTURE_INPUT;
                    busy_o <= 1'b1;
                end
            end

            CAPTURE_INPUT: begin
                if (fifo_full_i) begin
                    local_sernum <= 16'h0000;
                end else begin
                    local_sernum <= sernum_i;
                end
                state <= WRITE_HEADER;
            end

            WRITE_HEADER: begin
                fifo_in_o <= 8'hFF;
                fifo_write_strobe_o <= 1'b1;
                fifo_write_strobe_count <= 4'b0001;
                post_strobe_state <= WRITE_SERNUM;
                state <= WRITE_HEADER;
            end

            WRITE_SERNUM: begin
                fifo_in_o <= local_sernum[15:8];
                fifo_write_strobe_o <= 1'b1;
                fifo_write_strobe_count <= 4'b0001;
                post_strobe_state <= WRITE_SERNUM_2;
                state <= WRITE_SERNUM;
            end

            WRITE_SERNUM_2: begin
                fifo_in_o <= local_sernum[7:0];
                fifo_write_strobe_o <= 1'b1;
                fifo_write_strobe_count <= 4'b0001;
                post_strobe_state <= WRITE_COUNT;
                state <= WRITE_SERNUM_2;
            end

            WRITE_COUNT: begin
                fifo_in_o <= local_count[31:24];
                fifo_write_strobe_o <= 1'b1;
                fifo_write_strobe_count <= 4'b0001;
                post_strobe_state <= WRITE_COUNT_2;
                state <= WRITE_COUNT;
            end

            WRITE_COUNT_2: begin
                fifo_in_o <= local_count[23:16];
                fifo_write_strobe_o <= 1'b1;
                fifo_write_strobe_count <= 4'b0001;
                post_strobe_state <= WRITE_COUNT_3;
                state <= WRITE_COUNT_2;
            end

            WRITE_COUNT_3: begin
                fifo_in_o <= local_count[15:8];
                fifo_write_strobe_o <= 1'b1;
                fifo_write_strobe_count <= 4'b0001;
                post_strobe_state <= WRITE_COUNT_4;
                state <= WRITE_COUNT_3;
            end

            WRITE_COUNT_4: begin
                fifo_in_o <= local_count[7:0];
                fifo_write_strobe_o <= 1'b1;
                fifo_write_strobe_count <= 4'b0001;
                post_strobe_state <= COMPLETE;
                state <= WRITE_COUNT_4;
            end

            COMPLETE: begin
                fifo_write_strobe_o <= 1'b0;
                busy_o <= 1'b0;
                state <= IDLE;
            end

            default: begin
                state <= IDLE;
            end
        endcase

        if (fifo_write_strobe_o) begin
            fifo_write_strobe_count <= fifo_write_strobe_count + 1'b1;
            if (fifo_write_strobe_count == 4'b1000) begin
                fifo_write_strobe_o <= 1'b0;
                state <= post_strobe_state;
            end
        end
    end
endmodule