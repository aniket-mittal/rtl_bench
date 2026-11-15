module rtlpp_03330 (
    clk, rstn, data_in, data_valid, rdreq, data_out, data_out_valid, full
);

   input         clk;
   input         rstn;
   input [135:0] data_in;
   input         data_valid;
   input         rdreq;

   output [135:0] data_out;
   output        data_out_valid;
   output        full;

   reg [135:0]   data_fifo [0:127];
   reg [6:0]     data_fifo_wptr;
   reg [6:0]     data_fifo_rptr;
   reg [6:0]     data_fifo_count;
   reg [6:0]     ctl_shift_reg;
   reg           empty;
   reg           almost_full;
   reg           data_out_valid;
   reg           full;

   wire          rdreq_int;
   wire          data_bit; 

   assign data_bit = 1'b1;
   assign rdreq_int = (rdreq == 1'b1) & (empty == 1'b0);

   // Data FIFO logic
   always @ (posedge clk or negedge rstn) begin
       if (!rstn) begin
           data_fifo_wptr <= 7'h0;
           data_fifo_rptr <= 7'h0;
           data_fifo_count <= 7'h0;
       end else begin
           if (data_valid && !almost_full) begin
               data_fifo[data_fifo_wptr] <= data_in;
               data_fifo_wptr <= data_fifo_wptr + 1;
               data_fifo_count <= data_fifo_count + 1;
           end
           if (rdreq_int) begin
               data_fifo_rptr <= data_fifo_rptr + 1;
               data_fifo_count <= data_fifo_count - 1;
           end
           empty <= (data_fifo_count == 7'd0);
           almost_full <= (data_fifo_count >= 7'd126);
           full <= (data_fifo_count == 7'd127);
       end
   end

   assign data_out = data_fifo[data_fifo_rptr];

   // Control shift register logic 
   always @ (posedge clk or negedge rstn) begin
       if (!rstn) begin
           ctl_shift_reg <= 7'h0;
       end else begin
           ctl_shift_reg <= {data_valid, ctl_shift_reg[6:1]};   
       end
   end
   
   // Generating data out valid signal
   always @ (posedge clk or negedge rstn) begin
       if (!rstn) begin
           data_out_valid <= 1'b0;
       end else begin
           data_out_valid <= (rdreq == 1'b1) & (empty == 1'b0);
       end
   end

   // Control FIFO logic
   reg [0:0] ctl_fifo [0:127];
   reg [6:0] ctl_fifo_wptr;
   reg [6:0] ctl_fifo_rptr;
   reg [6:0] ctl_fifo_count;

   always @ (posedge clk or negedge rstn) begin
       if (!rstn) begin
           ctl_fifo_wptr <= 7'h0;
           ctl_fifo_rptr <= 7'h0;
           ctl_fifo_count <= 7'h0;
       end else begin
           if (ctl_shift_reg[0] && !full) begin
               ctl_fifo[ctl_fifo_wptr] <= data_bit;
               ctl_fifo_wptr <= ctl_fifo_wptr + 1;
               ctl_fifo_count <= ctl_fifo_count + 1;
           end
           if (rdreq_int) begin
               ctl_fifo_rptr <= ctl_fifo_rptr + 1;
               ctl_fifo_count <= ctl_fifo_count - 1;
           end
           empty <= (ctl_fifo_count == 7'd0);
       end
   end

endmodule