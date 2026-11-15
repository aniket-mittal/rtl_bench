// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07571 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h26264767;
    stim[1] = 31'h3005ba5d;
    stim[2] = 31'h5c26c79a;
    stim[3] = 31'h65544048;
    stim[4] = 31'h77083dbe;
    stim[5] = 31'h47750887;
    stim[6] = 31'h51935016;
    stim[7] = 31'h7b16fd75;
    stim[8] = 31'h58f85170;
    stim[9] = 31'h5661f7b6;
    stim[10] = 31'h6411ad6b;
    stim[11] = 31'h32522f6e;
    stim[12] = 31'h57ce0cca;
    stim[13] = 31'h401109c7;
    stim[14] = 31'h7a471362;
    stim[15] = 31'h606ee60d;
    stim[16] = 31'h4a1d3fff;
    stim[17] = 31'h7131bbb3;
    stim[18] = 31'h42871b85;
    stim[19] = 31'h735ca2d1;
    stim[20] = 31'h6b77700c;
    stim[21] = 31'h64131e1b;
    stim[22] = 31'h50dc3e4f;
    stim[23] = 31'h7f1e659c;
    stim[24] = 31'h7d77765d;
    stim[25] = 31'h7280c5f2;
    stim[26] = 31'h59f9bc8f;
    stim[27] = 31'h45eb65d3;
    stim[28] = 31'h7e3e37e7;
    stim[29] = 31'h55514221;
    stim[30] = 31'h56ff53fa;
    stim[31] = 31'h694942c6;
    stim[32] = 31'h6671184f;
    stim[33] = 31'h61f81961;
    stim[34] = 31'h415c96af;
    stim[35] = 31'h591a75b5;
    stim[36] = 31'h5e151df1;
    stim[37] = 31'h44098249;
    stim[38] = 31'h77955192;
    stim[39] = 31'h6c2ca385;
    stim[40] = 31'h498e52d9;
    stim[41] = 31'h712d5023;
    stim[42] = 31'h5bf2d03f;
    stim[43] = 31'h52b505a1;
    stim[44] = 31'h73a15592;
    stim[45] = 31'h52b108a3;
    stim[46] = 31'h685a0000;
    stim[47] = 31'h5301fa0e;
    stim[48] = 31'h576a1c10;
    stim[49] = 31'h7ec2f9c6;
    stim[50] = 31'h4666aba4;
    stim[51] = 31'h556f1f1a;
    stim[52] = 31'h415df084;
    stim[53] = 31'h4f8c7ed8;
    stim[54] = 31'h646a9fa4;
    stim[55] = 31'h729cd0f8;
    stim[56] = 31'h57cff309;
    stim[57] = 31'h42abb5ab;
    stim[58] = 31'h6c7400c9;
    stim[59] = 31'h514f4130;
    stim[60] = 31'h61c74f68;
    stim[61] = 31'h6a8ae290;
    stim[62] = 31'h48a94a61;
    stim[63] = 31'h756b056b;
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
      expv[0] = 36'hxxxxxxxxb;
      expv[1] = 36'hxxxxxxxxe;
      expv[2] = 36'hxxxxxxxx9;
      expv[3] = 36'hxxxxxxxx9;
      expv[4] = 36'h000001c26;
      expv[5] = 36'h000002173;
      expv[6] = 36'h00000217e;
      expv[7] = 36'h000002174;
      expv[8] = 36'h00000518b;
      expv[9] = 36'h00000518c;
      expv[10] = 36'h000005189;
      expv[11] = 36'h000005bfe;
      expv[12] = 36'h000005bfc;
      expv[13] = 36'h000005bfc;
      expv[14] = 36'h000005bf4;
      expv[15] = 36'h0000017d4;
      expv[16] = 36'h000003223;
      expv[17] = 36'h00000322e;
      expv[18] = 36'h000003cbe;
      expv[19] = 36'h000003cb9;
      expv[20] = 36'h000001064;
      expv[21] = 36'h0000023c4;
      expv[22] = 36'h000002f3b;
      expv[23] = 36'h000002f39;
      expv[24] = 36'h000004423;
      expv[25] = 36'h00000234e;
      expv[26] = 36'h0000000c4;
      expv[27] = 36'h0000000c4;
      expv[28] = 36'h0000000ce;
      expv[29] = 36'h000003321;
      expv[30] = 36'h000003323;
      expv[31] = 36'h00000332b;
      expv[32] = 36'h000003dbe;
      expv[33] = 36'h00000070e;
      expv[34] = 36'h000000d7e;
      expv[35] = 36'h000000d71;
      expv[36] = 36'h000000d7b;
      expv[37] = 36'h000000d7e;
      expv[38] = 36'h000000d79;
      expv[39] = 36'h000004c04;
      expv[40] = 36'h000002396;
      expv[41] = 36'h00000239b;
      expv[42] = 36'h000003951;
      expv[43] = 36'h000003956;
      expv[44] = 36'h00000395e;
      expv[45] = 36'h000003929;
      expv[46] = 36'h000003921;
      expv[47] = 36'h000001f76;
      expv[48] = 36'h000001f7e;
      expv[49] = 36'h000001f74;
      expv[50] = 36'h000005236;
      expv[51] = 36'h00000523e;
      expv[52] = 36'h00000523e;
      expv[53] = 36'h000005239;
      expv[54] = 36'h000005239;
      expv[55] = 36'h000005dc6;
      expv[56] = 36'h00000222e;
      expv[57] = 36'h00000222e;
      expv[58] = 36'h00000222c;
      expv[59] = 36'h000004f44;
      expv[60] = 36'h000004f44;
      expv[61] = 36'h000002d06;
      expv[62] = 36'h000002ed3;
      expv[63] = 36'h000002edc;
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
