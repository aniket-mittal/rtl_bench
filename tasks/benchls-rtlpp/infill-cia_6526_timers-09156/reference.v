module rtlpp_09156
(
    input        clk,           
    input        clk7_en,
    input        clk7n_en,
    input        aen,           
    input        rd,            
    input        wr,            
    input        reset,         
    input  [3:0] rs,            
    input  [7:0] data_in,       
    output [7:0] data_out,      
    input        tick,          
    input        eclk,          
    output       irq,           
    input  [7:2] porta_in,      
    output [3:0] porta_out,     
    input  [7:0] portb_in,      

    input        kms_level,
    input  [1:0] kbd_mouse_type,
    input  [7:0] kbd_mouse_data,
    output       freeze,        
    input        hrtmon_en
);

wire [7:0] icr_out;
wire [7:0] tmra_out;
wire [7:0] tmrb_out;
wire [7:0] tmrd_out;
wire [7:0] sdr_out;
reg  [7:0] pa_out;
reg  [7:0] pb_out;
wire [7:0] portb_out;
wire       alrm;        
wire       ta;          
wire       tb;          
wire       tmra_ovf;      

wire       spmode;        
wire       ser_tx_irq;      
reg  [3:0] ser_tx_cnt;   
reg        ser_tx_run;      

reg        tick_del;      

wire  pra, prb, ddra, ddrb, cra, talo, tahi, crb, tblo, tbhi, tdlo, tdme, tdhi, icrs, sdr;
wire  enable;

assign enable = aen & (rd | wr);

assign  pra  = enable && rs==4'h0;
assign  prb  = enable && rs==4'h1;
assign  ddra = enable && rs==4'h2;
assign  ddrb = enable && rs==4'h3;
assign  talo = enable && rs==4'h4;
assign  tahi = enable && rs==4'h5;
assign  tblo = enable && rs==4'h6;
assign  tbhi = enable && rs==4'h7;
assign  tdlo = enable && rs==4'h8;
assign  tdme = enable && rs==4'h9;
assign  tdhi = enable && rs==4'hA;
assign  sdr  = enable && rs==4'hC;
assign  icrs = enable && rs==4'hD;
assign  cra  = enable && rs==4'hE;
assign  crb  = enable && rs==4'hF;

assign data_out = icr_out | tmra_out | tmrb_out | tmrd_out | sdr_out | pb_out | pa_out;

reg        keystrobe;
reg  [7:0] sdr_latch;

reg    freeze_reg = 0;
assign freeze = freeze_reg;

always @(posedge clk) begin
    reg kms_levelD;
    if (clk7n_en) begin
        kms_levelD <= kms_level;
        keystrobe <= (kms_level ^ kms_levelD) && (kbd_mouse_type == 2);
    end
end

always @(posedge clk) begin
    if (reset) begin
        sdr_latch[7:0] <= 0;
        freeze_reg <= 0;
    end else if (clk7_en) begin
        if (keystrobe) begin
            sdr_latch[7:0] <= ~{kbd_mouse_data[6:0], kbd_mouse_data[7]};
            if (hrtmon_en && (kbd_mouse_data == 8'h5f)) freeze_reg <= 1;
            else freeze_reg <= 0;
        end else if (wr & sdr) sdr_latch[7:0] <= data_in[7:0];
    end
end

assign sdr_out = (!wr && sdr) ? sdr_latch[7:0] : 8'h00;

always @(posedge clk)
    if (clk7_en) begin
        if (reset || !spmode) 
            ser_tx_run <= 0;
        else if (sdr && wr) 
            ser_tx_run <= 1;
        else if (ser_tx_irq) 
            ser_tx_run <= 0;
    end

always @(posedge clk)
    if (clk7_en) begin
        if (!ser_tx_run)
            ser_tx_cnt <= 4'd0;
        else if (tmra_ovf) 
            ser_tx_cnt <= ser_tx_cnt + 4'd1;
    end

assign ser_tx_irq = &ser_tx_cnt & tmra_ovf; 

reg [7:2] porta_in2;
reg [3:0] regporta;
reg [7:0] ddrporta;

always @(posedge clk)
    if (clk7_en) begin
        porta_in2[7:2] <= porta_in[7:2];
    end

always @(posedge clk)
    if (clk7_en) begin
        if (reset)
            regporta[3:0] <= 4'd0;
        else if (wr && pra)
            regporta[3:0] <= {data_in[7:6], data_in[1:0]};
    end

always @(posedge clk)
    if (clk7_en) begin
        if (reset)
            ddrporta[7:0] <= 8'd0;
        else if (wr && ddra)
            ddrporta[7:0] <= data_in[7:0];
    end

always @(*) begin
    if (!wr && pra)
        pa_out[7:0] = {porta_in2[7:2], porta_out[1:0]};
    else if (!wr && ddra)
        pa_out[7:0] = ddrporta[7:0];
    else
        pa_out[7:0] = 8'h00;
end

assign porta_out[3:0] = {(~ddrporta[7:6] | regporta[3:2]), (~ddrporta[1:0] | regporta[1:0])};

reg [7:0] ddrportb;

always @(posedge clk)
    if (clk7_en) begin
        if (reset)
            ddrportb[7:0] <= 8'd0;
        else if (wr && ddrb)
            ddrportb[7:0] <= (data_in[7:0]);
    end

always @(*) begin
    if (!wr && prb)
        pb_out[7:0] = portb_in[7:0];
    else if (!wr && ddrb)
        pb_out[7:0] = (ddrportb[7:0]);
    else
        pb_out[7:0] = 8'h00;
end

always @(posedge clk)
    if (clk7_en) begin
        tick_del <= tick;
    end

// cia_int module internal logic
// Replacing the instantiation with internal functionality
reg icr_flag;
reg [7:0] icr_data_out;
always @(posedge clk) begin
    if (reset) begin
        icr_flag <= 0;
    end else if (clk7_en) begin
        icr_flag <= wr && icrs;
    end
end

always @(*) begin
    if (!wr && icrs) begin
        icr_data_out = data_in;
    end else begin
        icr_data_out = 8'h00;
    end
end

assign icr_out = icr_data_out;
assign irq = icr_flag;

// cia_timera module internal logic
// Replacing the instantiation with internal functionality
reg [15:0] tmra_cnt;
reg [7:0] tmra_latch;
always @(posedge clk) begin
    if (reset) begin
        tmra_cnt <= 16'd0;
    end else if (clk7_en) begin
        if (wr && (talo || tahi)) begin
            if (talo) begin
                tmra_cnt[7:0] <= data_in;
            end
            if (tahi) begin
                tmra_cnt[15:8] <= data_in;
            end
        end
    end
end

always @(posedge clk) begin
    if (clk7_en) begin
        if (tmra_cnt == 16'd0) begin
            tmra_cnt <= 16'd0;
        end else begin
            tmra_cnt <= tmra_cnt - 16'd1;
        end
    end
end

assign tmra_ovf = (tmra_cnt == 16'd0);
assign tmra_out = tmra_latch;
assign ta = tmra_ovf;

// cia_timerb module internal logic
// Replacing the instantiation with internal functionality
reg [15:0] tmrb_cnt;
reg [7:0] tmrb_latch;
always @(posedge clk) begin
    if (reset) begin
        tmrb_cnt <= 16'd0;
    end else if (clk7_en) begin
        if (wr && (tblo || tbhi)) begin
            if (tblo) begin
                tmrb_cnt[7:0] <= data_in;
            end
            if (tbhi) begin
                tmrb_cnt[15:8] <= data_in;
            end
        end
    end
end

always @(posedge clk) begin
    if (clk7_en) begin
        if (tmrb_cnt == 16'd0) begin
            tmrb_cnt <= 16'd0;
        end else begin
            tmrb_cnt <= tmrb_cnt - 16'd1;
        end
    end
end

assign tb = (tmrb_cnt == 16'd0);
assign tmrb_out = tmrb_latch;

// cia_timerd module internal logic
// Replacing the instantiation with internal functionality
reg [23:0] tmrd_cnt;
reg [7:0] tmrd_latch;
always @(posedge clk) begin
    if (reset) begin
        tmrd_cnt <= 24'd0;
    end else if (clk7_en) begin
        if (wr && (tdlo || tdme || tdhi)) begin
            if (tdlo) begin
                tmrd_cnt[7:0] <= data_in;
            end
            if (tdme) begin
                tmrd_cnt[15:8] <= data_in;
            end
            if (tdhi) begin
                tmrd_cnt[23:16] <= data_in;
            end
        end
    end
end

always @(posedge clk) begin
    if (clk7_en) begin
        if (tmrd_cnt == 24'd0) begin
            tmrd_cnt <= 24'd0;
        end else begin
            tmrd_cnt <= tmrd_cnt - 24'd1;
        end
    end
end

assign alrm = (tmrd_cnt == 24'd0);
assign tmrd_out = tmrd_latch;

endmodule