// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 78;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06875 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .x_in(in_vec[7:0]),
    .clk2(out_vec[77:77]),
    .x_e(out_vec[76:60]),
    .x_o(out_vec[59:43]),
    .g0(out_vec[42:26]),
    .g1(out_vec[25:9]),
    .y_out(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h115;
    stim[1] = 9'h127;
    stim[2] = 9'h031;
    stim[3] = 9'h0c7;
    stim[4] = 9'h0cf;
    stim[5] = 9'h082;
    stim[6] = 9'h0ec;
    stim[7] = 9'h04d;
    stim[8] = 9'h023;
    stim[9] = 9'h0dd;
    stim[10] = 9'h08b;
    stim[11] = 9'h01e;
    stim[12] = 9'h03c;
    stim[13] = 9'h0d9;
    stim[14] = 9'h0c1;
    stim[15] = 9'h035;
    stim[16] = 9'h055;
    stim[17] = 9'h07b;
    stim[18] = 9'h0f9;
    stim[19] = 9'h06d;
    stim[20] = 9'h00c;
    stim[21] = 9'h048;
    stim[22] = 9'h0eb;
    stim[23] = 9'h0a5;
    stim[24] = 9'h044;
    stim[25] = 9'h0b0;
    stim[26] = 9'h0ba;
    stim[27] = 9'h082;
    stim[28] = 9'h0cb;
    stim[29] = 9'h061;
    stim[30] = 9'h090;
    stim[31] = 9'h00e;
    stim[32] = 9'h094;
    stim[33] = 9'h0b7;
    stim[34] = 9'h027;
    stim[35] = 9'h03f;
    stim[36] = 9'h08e;
    stim[37] = 9'h09c;
    stim[38] = 9'h0aa;
    stim[39] = 9'h0cf;
    stim[40] = 9'h0ab;
    stim[41] = 9'h045;
    stim[42] = 9'h0d9;
    stim[43] = 9'h09f;
    stim[44] = 9'h020;
    stim[45] = 9'h0d9;
    stim[46] = 9'h07d;
    stim[47] = 9'h017;
    stim[48] = 9'h014;
    stim[49] = 9'h0da;
    stim[50] = 9'h07d;
    stim[51] = 9'h04e;
    stim[52] = 9'h0ad;
    stim[53] = 9'h0c2;
    stim[54] = 9'h0d1;
    stim[55] = 9'h079;
    stim[56] = 9'h0a1;
    stim[57] = 9'h0aa;
    stim[58] = 9'h0f9;
    stim[59] = 9'h027;
    stim[60] = 9'h0af;
    stim[61] = 9'h0b4;
    stim[62] = 9'h08a;
    stim[63] = 9'h062;
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
      expv[0] = 78'hxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 78'hxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 78'hxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 78'h20031xxxxxxxxxxxxxxx;
      expv[4] = 78'h00031xxxxxxxxxxxxxxx;
      expv[5] = 78'h3ffcfffe3xxxxxxxxxxx;
      expv[6] = 78'h1ffcfffe3fccbxxxxxxx;
      expv[7] = 78'h3ffecffc17ccbxxxxxxx;
      expv[8] = 78'h1ffecffc17ad9f3c0xxx;
      expv[9] = 78'h200230026fad9f3c0xxx;
      expv[10] = 78'h00023002683200a13989;
      expv[11] = 78'h3ff8bffee83200a13989;
      expv[12] = 78'h1ff8bffeef3c7fb1a25d;
      expv[13] = 78'h2003c000f73c7fb1a25d;
      expv[14] = 78'h0003c000f00c0c3b2fa7;
      expv[15] = 78'h3ffc1ffec80c0c3b2fa7;
      expv[16] = 78'h1ffc1ffecfbb63b71020;
      expv[17] = 78'h20055001afbb63b71020;
      expv[18] = 78'h00055001a86c9462abca;
      expv[19] = 78'h3fff9003d86c9462abca;
      expv[20] = 78'h1fff9003d83e24bffa4c;
      expv[21] = 78'h2000c003683e24bffa4c;
      expv[22] = 78'h0000c00368110496866f;
      expv[23] = 78'h3ffeb00240110496866f;
      expv[24] = 78'h1ffeb00247e2005c464f;
      expv[25] = 78'h20044ffd2fe2005c464f;
      expv[26] = 78'h00044ffd28710f554c26;
      expv[27] = 78'h3ffbaffd80710f554c26;
      expv[28] = 78'h1ffbaffd87b4f391b7c6;
      expv[29] = 78'h3ffcbffc17b4f391b7c6;
      expv[30] = 78'h1ffcbffc175afb41f9b6;
      expv[31] = 78'h3ff900030f5afb41f9b6;
      expv[32] = 78'h1ff900030ef7ccc2a977;
      expv[33] = 78'h3ff9400076f7ccc2a977;
      expv[34] = 78'h1ff9400076cb03fe661f;
      expv[35] = 78'h20027ffdbecb03fe661f;
      expv[36] = 78'h00027ffdbfeb638259b1;
      expv[37] = 78'h3ff8e001ffeb638259b1;
      expv[38] = 78'h1ff8e001ff45dc7c27bc;
      expv[39] = 78'h3ffaaffce745dc7c27bc;
      expv[40] = 78'h1ffaaffce6f3db48920f;
      expv[41] = 78'h3ffabffe7ef3db48920f;
      expv[42] = 78'h1ffabffe7f0ebbc7dd61;
      expv[43] = 78'h3ffd90022f0ebbc7dd61;
      expv[44] = 78'h1ffd90022f68bc7fffa7;
      expv[45] = 78'h20020ffcff68bc7fffa7;
      expv[46] = 78'h00020ffcf81b474c0a1a;
      expv[47] = 78'h2007dffec81b474c0a1a;
      expv[48] = 78'h0007dffec90eb3d7cfac;
      expv[49] = 78'h20014000b90eb3d7cfac;
      expv[50] = 78'h00014000b8961430822f;
      expv[51] = 78'h2007dffed0961430822f;
      expv[52] = 78'h0007dffed10403ba8a3d;
      expv[53] = 78'h3ffad002710403ba8a3d;
      expv[54] = 78'h1ffad00277ce848c341e;
      expv[55] = 78'h3ffd1ffe17ce848c341e;
      expv[56] = 78'h1ffd1ffe175b07843c39;
      expv[57] = 78'h3ffa1003cf5b07843c39;
      expv[58] = 78'h1ffa1003cf1e14da4998;
      expv[59] = 78'h3fff9ffd571e14da4998;
      expv[60] = 78'h1fff9ffd579dd7510634;
      expv[61] = 78'h3ffaf0013f9dd7510634;
      expv[62] = 78'h1ffaf0013f5cd457618f;
      expv[63] = 78'h3ff8affda75cd457618f;
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
