// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087008 dut (
    .clk(clk),
    .ctrl(in_vec[7:3]),
    .din(in_vec[2:1]),
    .sel(in_vec[0:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hc2;
    stim[1] = 8'h91;
    stim[2] = 8'h34;
    stim[3] = 8'hc8;
    stim[4] = 8'ha1;
    stim[5] = 8'he2;
    stim[6] = 8'h2c;
    stim[7] = 8'ha5;
    stim[8] = 8'hc1;
    stim[9] = 8'haf;
    stim[10] = 8'hce;
    stim[11] = 8'hda;
    stim[12] = 8'h40;
    stim[13] = 8'h8d;
    stim[14] = 8'h4a;
    stim[15] = 8'h04;
    stim[16] = 8'h57;
    stim[17] = 8'h36;
    stim[18] = 8'h2f;
    stim[19] = 8'h48;
    stim[20] = 8'h71;
    stim[21] = 8'h3c;
    stim[22] = 8'h1a;
    stim[23] = 8'hb2;
    stim[24] = 8'ha4;
    stim[25] = 8'h35;
    stim[26] = 8'h59;
    stim[27] = 8'hbc;
    stim[28] = 8'h0b;
    stim[29] = 8'heb;
    stim[30] = 8'hbf;
    stim[31] = 8'h72;
    stim[32] = 8'he6;
    stim[33] = 8'hd7;
    stim[34] = 8'h45;
    stim[35] = 8'hbc;
    stim[36] = 8'h50;
    stim[37] = 8'hbe;
    stim[38] = 8'h3b;
    stim[39] = 8'h82;
    stim[40] = 8'h1f;
    stim[41] = 8'h78;
    stim[42] = 8'hfa;
    stim[43] = 8'h75;
    stim[44] = 8'h8c;
    stim[45] = 8'h83;
    stim[46] = 8'hcb;
    stim[47] = 8'h5d;
    stim[48] = 8'h02;
    stim[49] = 8'hbc;
    stim[50] = 8'hc6;
    stim[51] = 8'h2c;
    stim[52] = 8'h7a;
    stim[53] = 8'h9e;
    stim[54] = 8'hfa;
    stim[55] = 8'h60;
    stim[56] = 8'h81;
    stim[57] = 8'h19;
    stim[58] = 8'h3b;
    stim[59] = 8'h21;
    stim[60] = 8'h8b;
    stim[61] = 8'h9a;
    stim[62] = 8'hf6;
    stim[63] = 8'he3;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000001;
      expv[2] = 32'h00000002;
      expv[3] = 32'h00000002;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000001;
      expv[6] = 32'h00000001;
      expv[7] = 32'h00000002;
      expv[8] = 32'h00200003;
      expv[9] = 32'h00200004;
      expv[10] = 32'h00600005;
      expv[11] = 32'h00000003;
      expv[12] = 32'h00000001;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00040001;
      expv[15] = 32'h00000001;
      expv[16] = 32'h00000002;
      expv[17] = 32'h00000c03;
      expv[18] = 32'h00000003;
      expv[19] = 32'h00000064;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000001;
      expv[22] = 32'h00000002;
      expv[23] = 32'h00000001;
      expv[24] = 32'h00000001;
      expv[25] = 32'h00000002;
      expv[26] = 32'h00000083;
      expv[27] = 32'h00000084;
      expv[28] = 32'h00000002;
      expv[29] = 32'h00000003;
      expv[30] = 32'h20000004;
      expv[31] = 32'h01800005;
      expv[32] = 32'h00000001;
      expv[33] = 32'h00000003;
      expv[34] = 32'h0c000004;
      expv[35] = 32'h00000205;
      expv[36] = 32'h00000002;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000003;
      expv[39] = 32'h00000084;
      expv[40] = 32'h00000001;
      expv[41] = 32'h0000001a;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000001;
      expv[44] = 32'h00008002;
      expv[45] = 32'h00000002;
      expv[46] = 32'h00010003;
      expv[47] = 32'h02010004;
      expv[48] = 32'h00001005;
      expv[49] = 32'h00000001;
      expv[50] = 32'h00000002;
      expv[51] = 32'h00000003;
      expv[52] = 32'h00000002;
      expv[53] = 32'h00000001;
      expv[54] = 32'h00000003;
      expv[55] = 32'h00000001;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000001;
      expv[58] = 32'h00000002;
      expv[59] = 32'h00000083;
      expv[60] = 32'h00000004;
      expv[61] = 32'h00020005;
      expv[62] = 32'h00000001;
      expv[63] = 32'h00000003;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
