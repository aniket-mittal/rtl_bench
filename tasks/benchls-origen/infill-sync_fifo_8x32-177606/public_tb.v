// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_177606 dut (
    .clk(clk),
    .fifo_wr_data(in_vec[34:3]),
    .fifo_wr_en(in_vec[2:2]),
    .fifo_rd_en(in_vec[1:1]),
    .rst_n(in_vec[0:0]),
    .fifo_rd_data(out_vec[35:4]),
    .fifo_full(out_vec[3:3]),
    .fifo_empty(out_vec[2:2]),
    .fifo_rd_err(out_vec[1:1]),
    .fifo_wr_err(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h187d36304;
    stim[1] = 35'h34a8f37f8;
    stim[2] = 35'h5249026c5;
    stim[3] = 35'h7956670af;
    stim[4] = 35'h5e096ff57;
    stim[5] = 35'h173d3da69;
    stim[6] = 35'h59dda29b9;
    stim[7] = 35'h5d8e1d019;
    stim[8] = 35'h0f080e9df;
    stim[9] = 35'h02a808071;
    stim[10] = 35'h311fcd84f;
    stim[11] = 35'h734a2a43b;
    stim[12] = 35'h0d1f33073;
    stim[13] = 35'h3843c1505;
    stim[14] = 35'h2002094c1;
    stim[15] = 35'h0814b25ed;
    stim[16] = 35'h12a5dc6eb;
    stim[17] = 35'h0cf5dbc6b;
    stim[18] = 35'h4fe572bd3;
    stim[19] = 35'h7d23a01e5;
    stim[20] = 35'h6c1b451b9;
    stim[21] = 35'h78b858261;
    stim[22] = 35'h3cf5f1905;
    stim[23] = 35'h5a7adb333;
    stim[24] = 35'h0bf3558e9;
    stim[25] = 35'h1e7b71d41;
    stim[26] = 35'h464367f7d;
    stim[27] = 35'h72c7444f7;
    stim[28] = 35'h5881ea425;
    stim[29] = 35'h7ffd99679;
    stim[30] = 35'h41740cd01;
    stim[31] = 35'h53cecce21;
    stim[32] = 35'h6ab82aacf;
    stim[33] = 35'h77cd3acdd;
    stim[34] = 35'h68686fc13;
    stim[35] = 35'h2898c060f;
    stim[36] = 35'h6501e2739;
    stim[37] = 35'h707a411c7;
    stim[38] = 35'h22b520d3f;
    stim[39] = 35'h4a33ca871;
    stim[40] = 35'h372a203c7;
    stim[41] = 35'h7b9e3bb0d;
    stim[42] = 35'h45afc682b;
    stim[43] = 35'h31c3477cb;
    stim[44] = 35'h3bca34799;
    stim[45] = 35'h79437a833;
    stim[46] = 35'h7a1fc3fdd;
    stim[47] = 35'h6610ffb6b;
    stim[48] = 35'h47cc2ef91;
    stim[49] = 35'h0171c534b;
    stim[50] = 35'h7f8b76337;
    stim[51] = 35'h21416363d;
    stim[52] = 35'h6ec9be3dd;
    stim[53] = 35'h25aeb098b;
    stim[54] = 35'h29ed0fae7;
    stim[55] = 35'h31b8bfda3;
    stim[56] = 35'h04ad73611;
    stim[57] = 35'h6d2f0fdff;
    stim[58] = 35'h66a914887;
    stim[59] = 35'h4ac6fc05f;
    stim[60] = 35'h7c1812dc3;
    stim[61] = 35'h1dc4164db;
    stim[62] = 35'h1115a5483;
    stim[63] = 35'h0eab44a8a;
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
      expv[0] = 36'hxxxxxxxx4;
      expv[1] = 36'hxxxxxxxx4;
      expv[2] = 36'hxxxxxxxx4;
      expv[3] = 36'ha49204d80;
      expv[4] = 36'hf2acce150;
      expv[5] = 36'hbc12dfea0;
      expv[6] = 36'hbc12dfea0;
      expv[7] = 36'hbc12dfea0;
      expv[8] = 36'hbc12dfea0;
      expv[9] = 36'h1e101d3b0;
      expv[10] = 36'h1e101d3b0;
      expv[11] = 36'h623f9b090;
      expv[12] = 36'hxxxxxxxx4;
      expv[13] = 36'hxxxxxxxx6;
      expv[14] = 36'h708782a02;
      expv[15] = 36'h708782a02;
      expv[16] = 36'h708782a02;
      expv[17] = 36'h102964bd0;
      expv[18] = 36'hxxxxxxxx4;
      expv[19] = 36'hxxxxxxxx6;
      expv[20] = 36'hfa47403c2;
      expv[21] = 36'hfa47403c2;
      expv[22] = 36'hfa47403c2;
      expv[23] = 36'hfa47403c2;
      expv[24] = 36'h79ebe3200;
      expv[25] = 36'h79ebe3200;
      expv[26] = 36'h79ebe3200;
      expv[27] = 36'h79ebe3200;
      expv[28] = 36'h8c86cfef0;
      expv[29] = 36'h8c86cfef0;
      expv[30] = 36'h8c86cfef0;
      expv[31] = 36'h8c86cfef0;
      expv[32] = 36'h8c86cfef0;
      expv[33] = 36'he58e889e0;
      expv[34] = 36'he58e889e0;
      expv[35] = 36'hb103d4840;
      expv[36] = 36'hd57055590;
      expv[37] = 36'hd57055590;
      expv[38] = 36'hef9a759b0;
      expv[39] = 36'h513180c10;
      expv[40] = 36'h513180c10;
      expv[41] = 36'he0f482380;
      expv[42] = 36'he0f482380;
      expv[43] = 36'h456a41a70;
      expv[44] = 36'h6e5440780;
      expv[45] = 36'h6e5440780;
      expv[46] = 36'hf73c77610;
      expv[47] = 36'hf73c77610;
      expv[48] = 36'hf43f87fb0;
      expv[49] = 36'hf43f87fb0;
      expv[50] = 36'hd57055594;
      expv[51] = 36'hff16ec662;
      expv[52] = 36'hff16ec662;
      expv[53] = 36'hff16ec662;
      expv[54] = 36'h4282c6c70;
      expv[55] = 36'hdd937c7b0;
      expv[56] = 36'h53da1f5c0;
      expv[57] = 36'h53da1f5c0;
      expv[58] = 36'hda5e1fbf0;
      expv[59] = 36'hcd5229100;
      expv[60] = 36'h958df80b0;
      expv[61] = 36'hf43f87fb4;
      expv[62] = 36'hf43f87fb6;
      expv[63] = 36'hda5e1fbf4;
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
