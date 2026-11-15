module rtlpp_02598 (
    input Clock, Reset,
    input [7:0] Red, Green, Blue,
    input [9:0] VScrollOffset, HScrollOffset,
    output reg H_Sync_out, V_Sync_out,
    output VideoBlanking_L,
    output [7:0] Red_out, Green_out, Blue_out,
    output [9:0] Column_out, Row_out
);

    parameter H_RES = 800;
    parameter V_RES = 480;

    parameter B = 72;       // Horizontal Back Porch (in pixels) (152)
    parameter C = 96;       // Horizontal Sync Pulse Width (in pixels) (1.2 us - 40 pixels (minimum))
    parameter D = H_RES;    // Horizontal Resolution (i.e. Visible area -- in pixels)
    parameter E = 24;       // Horizontal Front Porch (in pixels) (152)

    parameter P = 7;        // Vertical Back Porch (in pixels) (152)
    parameter Q = 12;       // Vertical Sync Pulse Width (in lines) (1.2 us - 40 pixels (minimum))
    parameter R = V_RES;    // Vertical Resolution (in lines) (i.e. Visible area -- in lines)
    parameter S = 3;        // Vertical Front Porch (in lines) (152)

    parameter H_TOTAL = (B + C + D + E);
    parameter H_RESPLUS = H_RES;
    parameter V_TOTAL = (P + Q + R + S);
    parameter V_RESPLUS = V_RES;

    reg [9:0] HCount, VCount;
    reg [9:0] Column_out_sig;
    reg [9:0] Row_out_sig;
    reg V_Clock;
    reg Blank_L;
    reg H_Data_On, V_Data_On;

    always@(posedge Clock) begin
        if (!Reset) begin
            HCount <= 0;
            Column_out_sig <= HScrollOffset;
            H_Data_On <= 0;
            H_Sync_out <= 1;
        end else begin
            Column_out_sig <= Column_out_sig + 10'd1;
            HCount <= HCount + 10'd1;
            V_Clock <= 0;

            if (HCount == B + C + D + E) begin
                HCount <= 0;
                Column_out_sig <= HScrollOffset;
                V_Clock <= 1;
            end

            if (HCount == D + E + B) begin
                H_Sync_out <= 1;
            end else if (HCount == D + E) begin
                H_Sync_out <= 0;
            end

            if (HCount == D + E + B + C) begin
                H_Data_On <= 1;
            end else if (HCount == D) begin
                H_Data_On <= 0;
            end
        end
    end

    always@(posedge V_Clock) begin
        if (!Reset) begin
            VCount <= 0;
            Row_out_sig <= VScrollOffset;
            V_Data_On <= 0;
            V_Sync_out <= 1;
        end else begin
            Row_out_sig <= Row_out_sig + 10'd1;
            VCount <= VCount + 10'd1;

            if (VCount == R + S + P + Q) begin
                VCount <= 0;
                Row_out_sig <= VScrollOffset;
            end

            if (VCount == R + S + P) begin
                V_Sync_out <= 1;
            end else if (VCount == R + S) begin
                V_Sync_out <= 0;
            end

            if (VCount == R + S + P + Q) begin
                V_Data_On <= 1;
            end else if (VCount == R) begin
                V_Data_On <= 0;
            end
        end
    end

    always@(posedge Clock) begin
        if (((HCount > H_RESPLUS) && (HCount < H_TOTAL)) || ((VCount > V_RESPLUS) && (VCount < V_TOTAL))) begin
            Blank_L <= 0;
        end else begin
            Blank_L <= 1;
        end
    end

    assign Red_out = H_Data_On & V_Data_On ? Red : 8'h0;
    assign Green_out = H_Data_On & V_Data_On ? Green : 8'h0;
    assign Blue_out = H_Data_On & V_Data_On ? Blue : 8'h0;

    assign Column_out = Column_out_sig;
    assign Row_out = Row_out_sig;
    assign VideoBlanking_L = Blank_L;

endmodule