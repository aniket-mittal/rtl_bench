module rtlpp_00186 (
               CLK, RST, 
               CE, WE, SEL, 
               DATI, DATO,
               RXD, TXD, CTS, RTS
           );

    input  CLK;          
    input  RST;          
    input  CE;           
    input  WE;           
    input  [3:0]SEL;     
    input  [31:0] DATI;  
    output [31:0] DATO;  
    input  RXD;          
    output TXD;          
    input  CTS;          
    output RTS;          

    reg    [31:0] DATO;

    reg    WRTXD,  RDRXD;
    reg    WRTXD1, RDRXD1;
    reg    [7:0] din_i;  
    wire   [7:0] dout_o; 
    reg    re_i, we_i;
    wire   full_o, empty_o;
    reg    [7:0] div0;
    reg    [7:0] div1;  
    wire   sio_ce, sio_ce_x4;

    // UART internal logic -- combining logic from sasc_top and sasc_brg modules

    // Baud rate generator logic
    reg [15:0] counter;
    reg sio_ce_int, sio_ce_x4_int;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            counter <= 0;
            sio_ce_int <= 0;
            sio_ce_x4_int <= 0;
        end else begin
            if (counter == {div0, div1}) begin
                sio_ce_int <= 1;
                counter <= 0;
            end else begin
                sio_ce_int <= 0;
                counter <= counter + 1;
            end

            sio_ce_x4_int <= (counter[1:0] == 2'b11); // Adjust as per requirement
        end
    end

    assign sio_ce = sio_ce_int;
    assign sio_ce_x4 = sio_ce_x4_int;

    // FIFO logic
    reg [7:0] fifo [15:0]; // Simple small FIFO
    reg [3:0] wptr, rptr;
    reg full, empty;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            wptr <= 4'b0;
            rptr <= 4'b0;
            full <= 1'b0;
            empty <= 1'b1;
        end else begin
            if (we_i && !full) begin
                fifo[wptr] <= din_i;
                wptr <= wptr + 1;
            end

            if (re_i && !empty) begin
                rptr <= rptr + 1;
            end

            full <= (wptr == (rptr - 1));
            empty <= (wptr == rptr);
        end
    end

    assign full_o = full;
    assign empty_o = empty;
    assign dout_o = fifo[rptr];

    // Main UART logic

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            div0 <= 8'h00;
        end else if ((CE == 1'b1) && (WE == 1'b1) && (SEL[3] == 1'b1)) begin
            div0 <= DATI[31:24];
        end
    end
	  
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            div1 <= 8'h00;
        end else if ((CE == 1'b1) && (WE == 1'b1) && (SEL[2] == 1'b1)) begin
            div1 <= DATI[23:16];
        end
    end
	  
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            din_i <= 8'h00;
        end else if (WRTXD) begin
            din_i <= DATI[7:0];
        end
    end		  

    always @(CE or div0 or div1 or full_o or empty_o or dout_o) begin
        if (CE == 1'b1) begin
            DATO[31:24] <= div0;
            DATO[23:16] <= div1;
	          DATO[15: 8] <= {6'h00, full_o, empty_o};
	          DATO[ 7: 0] <= dout_o;
        end else begin
            DATO <= 32'h00000000;
        end
    end

    always @(CE or WE or SEL) begin
        if ((CE == 1'b1) && (WE == 1'b1) && (SEL[0] == 1'b1)) begin
            WRTXD <= 1'b1;
        end else begin
            WRTXD <= 1'b0;
        end
    end

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            WRTXD1 <= 1'b0;
        end else begin
            WRTXD1 <= WRTXD;
        end
    end
    always @(WRTXD or WRTXD1) begin
        we_i <= ~WRTXD & WRTXD1; 
    end

    always @(CE or WE or SEL) begin
        if ((CE == 1'b1) && (WE == 1'b0) && (SEL[0] == 1'b1)) begin
            RDRXD <= 1'b1;
        end else begin
            RDRXD <= 1'b0;
        end
    end

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            RDRXD1 <= 1'b0;
        end else begin
            RDRXD1 <= RDRXD;
        end
    end  
    always @(RDRXD or RDRXD1) begin
        re_i <= ~RDRXD & RDRXD1; 
    end

    // Assign TXD and RTS based on simplistic UART logic (for example purposes)
    assign TXD = RXD;
    assign RTS = CTS;

endmodule