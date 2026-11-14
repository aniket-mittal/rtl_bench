// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135532 dut (
    .A(in_vec[35:20]),
    .B(in_vec[19:4]),
    .CTRL(in_vec[3:0]),
    .Result(out_vec[16:1]),
    .Overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h9769250e3;
    stim[1] = 36'h96861550d;
    stim[2] = 36'h13477eacc;
    stim[3] = 36'h06de74be7;
    stim[4] = 36'h984cf55d8;
    stim[5] = 36'h117511f17;
    stim[6] = 36'h504f442a4;
    stim[7] = 36'heafb1821b;
    stim[8] = 36'he3eaa1089;
    stim[9] = 36'hab6c56de2;
    stim[10] = 36'h54d26868a;
    stim[11] = 36'hc994f8514;
    stim[12] = 36'hf4f16fa85;
    stim[13] = 36'h9f02ad4bf;
    stim[14] = 36'h2f0aaf79a;
    stim[15] = 36'hf5658c962;
    stim[16] = 36'h0665ff4db;
    stim[17] = 36'h682849750;
    stim[18] = 36'h5bed32936;
    stim[19] = 36'h4de34ce07;
    stim[20] = 36'hdb58766ba;
    stim[21] = 36'h61f704d39;
    stim[22] = 36'h3881fe517;
    stim[23] = 36'h1b8142ccc;
    stim[24] = 36'h736045174;
    stim[25] = 36'hc4729dc72;
    stim[26] = 36'h82aa0fb82;
    stim[27] = 36'hdbcc2dac2;
    stim[28] = 36'h1864218b0;
    stim[29] = 36'h47448c85e;
    stim[30] = 36'h1f26aa5f1;
    stim[31] = 36'h716db5a78;
    stim[32] = 36'hfdc263c86;
    stim[33] = 36'h7faed073c;
    stim[34] = 36'h83dfd5474;
    stim[35] = 36'h0373f515f;
    stim[36] = 36'hde7e0b40e;
    stim[37] = 36'h6a2928268;
    stim[38] = 36'h97f8c9c8e;
    stim[39] = 36'h2d8de2aa7;
    stim[40] = 36'h5a13529b3;
    stim[41] = 36'h8dc881b03;
    stim[42] = 36'hdeb985349;
    stim[43] = 36'hdbfd8bdd6;
    stim[44] = 36'hf0c18d5fb;
    stim[45] = 36'hb8d41379b;
    stim[46] = 36'h18468d8f4;
    stim[47] = 36'h58995efc7;
    stim[48] = 36'haf56206e6;
    stim[49] = 36'hff1657f63;
    stim[50] = 36'ha1ebfd5b1;
    stim[51] = 36'h6c56e6140;
    stim[52] = 36'he45ae47a2;
    stim[53] = 36'h166d4edbd;
    stim[54] = 36'hefa89d9fa;
    stim[55] = 36'h66ae8202c;
    stim[56] = 36'h0e2912213;
    stim[57] = 36'h1ce312442;
    stim[58] = 36'h7f28c042b;
    stim[59] = 36'h0131c3aa9;
    stim[60] = 36'h7e24b505d;
    stim[61] = 36'h9606f4b28;
    stim[62] = 36'hbba5e548f;
    stim[63] = 36'h0378f1b55;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 17'h00004;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00028;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h1c994;
      expv[12] = 17'h1e3e8;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h0b280;
      expv[16] = 17'h00000;
      expv[17] = 17'h1633a;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h001cc;
      expv[25] = 17'h07200;
      expv[26] = 17'h15400;
      expv[27] = 17'h18000;
      expv[28] = 17'h073de;
      expv[29] = 17'h00000;
      expv[30] = 17'h0e98e;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h1fe0e;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00016;
      expv[41] = 17'h11b90;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h007f8;
      expv[50] = 17'h14920;
      expv[51] = 17'h0a4d5;
      expv[52] = 17'h0d000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00e28;
      expv[57] = 17'h19c60;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h18036;
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
