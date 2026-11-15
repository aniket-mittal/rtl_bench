module origen_035245 (
    input wire clk,
    input wire reset_n,
    input wire waitrequest,
    input wire readdatavalid,
    input wire [15:0] readdata,
    input wire ready,
    output reg read_n,
    output reg write_n,
    output reg chipselect,
    output reg [31:0] address,
    output reg [1:0] byteenable,
    output reg [15:0] writedata,
    output reg done,
    output reg [15:0] max,
    output reg [15:0] min,
    output reg [1:0] state
);

    localparam IDLE = 2'b00;
    localparam READ = 2'b01;
    localparam WRITE = 2'b10;
    localparam DONE = 2'b11;

    localparam SECOND = 50000000; // 50 MHz clock
    localparam BASE_SDRAM = 32'h0;

    reg [3:0] numread;
    reg write_flag;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            read_n <= 1'b1;
            write_n <= 1'b1;
            chipselect <= 1'b0;
            address <= BASE_SDRAM;
            byteenable <= 2'b11;
            writedata <= 16'h0000;
            done <= 1'b0;
            max <= 16'h0000;
            min <= 16'hFFFF;
            numread <= 4'b0000;
            write_flag <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (ready) begin
                        state <= READ;
                        address <= BASE_SDRAM;
                        chipselect <= 1'b1;
                        read_n <= 1'b0;
                        numread <= 4'b0000;
                    end
                end

                READ: begin
                    if (!waitrequest) begin
                        if (readdatavalid) begin
                            if (readdata > max) max <= readdata;
                            if (readdata < min) min <= readdata;
                            numread <= numread + 1'b1;
                            if (numread == 4'b1001) begin
                                state <= WRITE;
                                address <= BASE_SDRAM + 32'd10;
                                read_n <= 1'b1;
                                write_n <= 1'b0;
                                writedata <= min;
                                write_flag <= 1'b0;
                            end else begin
                                address <= address + 32'd1;
                            end
                        end
                    end
                end

                WRITE: begin
                    if (!waitrequest) begin
                        if (!write_flag) begin
                            address <= BASE_SDRAM + 32'd11;
                            writedata <= max;
                            write_flag <= 1'b1;
                        end else begin
                            state <= DONE;
                            write_n <= 1'b1;
                            chipselect <= 1'b0;
                            done <= 1'b1;
                        end
                    end
                end

                DONE: begin
                    if (!ready) begin
                        state <= IDLE;
                        done <= 1'b0;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule