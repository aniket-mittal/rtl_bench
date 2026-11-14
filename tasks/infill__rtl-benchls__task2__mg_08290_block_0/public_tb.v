// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08290 dut (
    .CLK(clk),
    .data(in_vec[31:0]),
    .piped_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h9aef376e;
    stim[1] = 32'h0807f011;
    stim[2] = 32'h52b14122;
    stim[3] = 32'hdb60200d;
    stim[4] = 32'h90c8f382;
    stim[5] = 32'hfa588e68;
    stim[6] = 32'h6f2ff97e;
    stim[7] = 32'h2bd0b5f7;
    stim[8] = 32'hca9c7c73;
    stim[9] = 32'he48f590b;
    stim[10] = 32'hbabbfb97;
    stim[11] = 32'h7546e574;
    stim[12] = 32'h7ed526a4;
    stim[13] = 32'h7865dea6;
    stim[14] = 32'hef9c49d9;
    stim[15] = 32'hfaf4bb14;
    stim[16] = 32'h9d3d41ad;
    stim[17] = 32'hdc597946;
    stim[18] = 32'h96048494;
    stim[19] = 32'hd5598b15;
    stim[20] = 32'ha38bd94c;
    stim[21] = 32'h21250793;
    stim[22] = 32'hb803a368;
    stim[23] = 32'h640ec702;
    stim[24] = 32'h333765c6;
    stim[25] = 32'h52d6cc59;
    stim[26] = 32'h9924df07;
    stim[27] = 32'h1755c3ed;
    stim[28] = 32'h035d34d9;
    stim[29] = 32'hb6b1218f;
    stim[30] = 32'hb221641d;
    stim[31] = 32'hbae2375f;
    stim[32] = 32'h40f4bcb7;
    stim[33] = 32'h254855bd;
    stim[34] = 32'had744e1d;
    stim[35] = 32'hc8e6e6a4;
    stim[36] = 32'h9209af9a;
    stim[37] = 32'he9e2ccfc;
    stim[38] = 32'h6cfff3f7;
    stim[39] = 32'h94358d13;
    stim[40] = 32'hb14e3068;
    stim[41] = 32'h0d533f59;
    stim[42] = 32'he89f8fb6;
    stim[43] = 32'h799d071f;
    stim[44] = 32'hdf9ed340;
    stim[45] = 32'hc2b546c7;
    stim[46] = 32'h987cfa8a;
    stim[47] = 32'haf2cb234;
    stim[48] = 32'h922b6d48;
    stim[49] = 32'hf0a9cb1e;
    stim[50] = 32'hfcbf7955;
    stim[51] = 32'h3843b573;
    stim[52] = 32'h895e4896;
    stim[53] = 32'h53a748e1;
    stim[54] = 32'h01dd2fca;
    stim[55] = 32'h8869288f;
    stim[56] = 32'h7a11bc11;
    stim[57] = 32'hd089a823;
    stim[58] = 32'hf8827048;
    stim[59] = 32'h745612db;
    stim[60] = 32'hc6a97c14;
    stim[61] = 32'h166ebec3;
    stim[62] = 32'hb31c7107;
    stim[63] = 32'hd7fbf030;
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
      expv[0] = 32'h9aef376e;
      expv[1] = 32'h0807f011;
      expv[2] = 32'h52b14122;
      expv[3] = 32'hdb60200d;
      expv[4] = 32'h90c8f382;
      expv[5] = 32'hfa588e68;
      expv[6] = 32'h6f2ff97e;
      expv[7] = 32'h2bd0b5f7;
      expv[8] = 32'hca9c7c73;
      expv[9] = 32'he48f590b;
      expv[10] = 32'hbabbfb97;
      expv[11] = 32'h7546e574;
      expv[12] = 32'h7ed526a4;
      expv[13] = 32'h7865dea6;
      expv[14] = 32'hef9c49d9;
      expv[15] = 32'hfaf4bb14;
      expv[16] = 32'h9d3d41ad;
      expv[17] = 32'hdc597946;
      expv[18] = 32'h96048494;
      expv[19] = 32'hd5598b15;
      expv[20] = 32'ha38bd94c;
      expv[21] = 32'h21250793;
      expv[22] = 32'hb803a368;
      expv[23] = 32'h640ec702;
      expv[24] = 32'h333765c6;
      expv[25] = 32'h52d6cc59;
      expv[26] = 32'h9924df07;
      expv[27] = 32'h1755c3ed;
      expv[28] = 32'h035d34d9;
      expv[29] = 32'hb6b1218f;
      expv[30] = 32'hb221641d;
      expv[31] = 32'hbae2375f;
      expv[32] = 32'h40f4bcb7;
      expv[33] = 32'h254855bd;
      expv[34] = 32'had744e1d;
      expv[35] = 32'hc8e6e6a4;
      expv[36] = 32'h9209af9a;
      expv[37] = 32'he9e2ccfc;
      expv[38] = 32'h6cfff3f7;
      expv[39] = 32'h94358d13;
      expv[40] = 32'hb14e3068;
      expv[41] = 32'h0d533f59;
      expv[42] = 32'he89f8fb6;
      expv[43] = 32'h799d071f;
      expv[44] = 32'hdf9ed340;
      expv[45] = 32'hc2b546c7;
      expv[46] = 32'h987cfa8a;
      expv[47] = 32'haf2cb234;
      expv[48] = 32'h922b6d48;
      expv[49] = 32'hf0a9cb1e;
      expv[50] = 32'hfcbf7955;
      expv[51] = 32'h3843b573;
      expv[52] = 32'h895e4896;
      expv[53] = 32'h53a748e1;
      expv[54] = 32'h01dd2fca;
      expv[55] = 32'h8869288f;
      expv[56] = 32'h7a11bc11;
      expv[57] = 32'hd089a823;
      expv[58] = 32'hf8827048;
      expv[59] = 32'h745612db;
      expv[60] = 32'hc6a97c14;
      expv[61] = 32'h166ebec3;
      expv[62] = 32'hb31c7107;
      expv[63] = 32'hd7fbf030;
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
