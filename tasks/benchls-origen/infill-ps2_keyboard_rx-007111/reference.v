module origen_007111(
    input wire rst,
    input wire clk,
    input wire ps2_clk,
    input wire ps2_data,
    output reg upa,
    output reg upb
);

// PS/2 clock synchronization
reg [2:0] ps2_clk_sync;
wire sampling;

always @(posedge clk or posedge rst) begin
    if (rst)
        ps2_clk_sync <= 3'b111;
    else
        ps2_clk_sync <= {ps2_clk_sync[1:0], ps2_clk};
end

assign sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];

// Data reception
reg [3:0] count;
reg [9:0] shift;
reg [7:0] data;
reg receiving;
reg received;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'd0;
        shift <= 10'd0;
        receiving <= 1'b0;
        received <= 1'b0;
    end else if (sampling) begin
        if (!receiving) begin
            if (!ps2_data) begin // Start bit
                receiving <= 1'b1;
                count <= 4'd0;
            end
        end else begin
            shift <= {ps2_data, shift[9:1]};
            count <= count + 4'd1;
            if (count == 4'd10) begin
                receiving <= 1'b0;
                if (shift[0] == 1'b0 && shift[9] == 1'b1 && ^shift[8:1] == shift[9]) begin
                    received <= 1'b1;
                    data <= shift[8:1];
                end
            end
        end
    end else if (received) begin
        received <= 1'b0;
    end
end

// FIFO
reg [7:0] fifo [7:0];
reg [2:0] w_ptr, r_ptr;
wire fifo_empty = (w_ptr == r_ptr);
wire fifo_full = ((w_ptr + 3'd1) & 3'b111) == r_ptr;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        w_ptr <= 3'd0;
        r_ptr <= 3'd0;
    end else begin
        if (received && !fifo_full) begin
            fifo[w_ptr] <= data;
            w_ptr <= (w_ptr + 3'd1) & 3'b111;
        end
        if (!fifo_empty) begin
            r_ptr <= (r_ptr + 3'd1) & 3'b111;
        end
    end
end

// Key detection
reg [7:0] prev_byte;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        upa <= 1'b0;
        upb <= 1'b0;
        prev_byte <= 8'h00;
    end else if (!fifo_empty) begin
        case (fifo[r_ptr])
            8'h1D: upa <= 1'b1;
            8'h1B: upa <= 1'b0;
            8'h75: upb <= 1'b1;
            8'h72: upb <= 1'b0;
            default: begin
                if (prev_byte == 8'hF0) begin
                    case (fifo[r_ptr])
                        8'h1D: upa <= 1'b0;
                        8'h75: upb <= 1'b0;
                    endcase
                end
            end
        endcase
        prev_byte <= fifo[r_ptr];
    end
end

endmodule