// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01817 dut (
    .clk(clk),
    .a(in_vec[23:16]),
    .b(in_vec[15:8]),
    .op1(in_vec[7:0]),
    .sum(out_vec[15:8]),
    .d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h47fc53;
    stim[1] = 24'hd195ca;
    stim[2] = 24'hdafbab;
    stim[3] = 24'h157e29;
    stim[4] = 24'ha9f170;
    stim[5] = 24'h7ea44a;
    stim[6] = 24'hb80def;
    stim[7] = 24'h5819b8;
    stim[8] = 24'h4cd049;
    stim[9] = 24'h8207d3;
    stim[10] = 24'h89142f;
    stim[11] = 24'h975fa1;
    stim[12] = 24'he68b2a;
    stim[13] = 24'h791f58;
    stim[14] = 24'hb7bc16;
    stim[15] = 24'haec7a8;
    stim[16] = 24'h5bc873;
    stim[17] = 24'he75e2c;
    stim[18] = 24'hace323;
    stim[19] = 24'h58e802;
    stim[20] = 24'hd31aee;
    stim[21] = 24'hbc4dda;
    stim[22] = 24'h6e003b;
    stim[23] = 24'h1fd3bb;
    stim[24] = 24'h57ffe4;
    stim[25] = 24'h7c9d6c;
    stim[26] = 24'h6cec33;
    stim[27] = 24'h23834b;
    stim[28] = 24'hc704bf;
    stim[29] = 24'h522f42;
    stim[30] = 24'haf148a;
    stim[31] = 24'hfc5010;
    stim[32] = 24'h23eeee;
    stim[33] = 24'h77c6ea;
    stim[34] = 24'hd11662;
    stim[35] = 24'he16e94;
    stim[36] = 24'h892ab2;
    stim[37] = 24'h716107;
    stim[38] = 24'hee7b88;
    stim[39] = 24'hf0a310;
    stim[40] = 24'h0b7145;
    stim[41] = 24'h505c2b;
    stim[42] = 24'h25a978;
    stim[43] = 24'hdb01ba;
    stim[44] = 24'h8c0c16;
    stim[45] = 24'hf5acbd;
    stim[46] = 24'h9fcba6;
    stim[47] = 24'h08e090;
    stim[48] = 24'hd8037e;
    stim[49] = 24'h9e9b78;
    stim[50] = 24'h98ef5e;
    stim[51] = 24'h7803e2;
    stim[52] = 24'h01049e;
    stim[53] = 24'h1c3b39;
    stim[54] = 24'hb8c893;
    stim[55] = 24'h0a1903;
    stim[56] = 24'heff839;
    stim[57] = 24'h7ab97a;
    stim[58] = 24'hf6bb18;
    stim[59] = 24'hfde39a;
    stim[60] = 24'h483478;
    stim[61] = 24'hd400bd;
    stim[62] = 24'h79a36e;
    stim[63] = 24'h5ad713;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h4fxx;
      expv[2] = 16'h5fxx;
      expv[3] = 16'ha6xx;
      expv[4] = 16'ha7xx;
      expv[5] = 16'h61xx;
      expv[6] = 16'heexx;
      expv[7] = 16'hfcxx;
      expv[8] = 16'hd1xx;
      expv[9] = 16'h19xx;
      expv[10] = 16'hdaxx;
      expv[11] = 16'h43xx;
      expv[12] = 16'h00xx;
      expv[13] = 16'hb5xx;
      expv[14] = 16'h77xx;
      expv[15] = 16'hd2xx;
      expv[16] = 16'h6fxx;
      expv[17] = 16'h3bxx;
      expv[18] = 16'h8axx;
      expv[19] = 16'h06xx;
      expv[20] = 16'heaxx;
      expv[21] = 16'h08xx;
      expv[22] = 16'h27xx;
      expv[23] = 16'h3bxx;
      expv[24] = 16'h8exx;
      expv[25] = 16'he3xx;
      expv[26] = 16'h09xx;
      expv[27] = 16'h1fxx;
      expv[28] = 16'hcexx;
      expv[29] = 16'hc3xx;
      expv[30] = 16'h71xx;
      expv[31] = 16'h9exx;
      expv[32] = 16'h60xx;
      expv[33] = 16'hdcxx;
      expv[34] = 16'hb0xx;
      expv[35] = 16'h78xx;
      expv[36] = 16'h02xx;
      expv[37] = 16'hdcxx;
      expv[38] = 16'h68xx;
      expv[39] = 16'h03xx;
      expv[40] = 16'hb3xx;
      expv[41] = 16'hb6xx;
      expv[42] = 16'h87xx;
      expv[43] = 16'h21xx;
      expv[44] = 16'hbbxx;
      expv[45] = 16'h22xx;
      expv[46] = 16'h69xx;
      expv[47] = 16'h71xx;
      expv[48] = 16'h70xx;
      expv[49] = 16'h81xx;
      expv[50] = 16'h13xx;
      expv[51] = 16'h4dxx;
      expv[52] = 16'he5xx;
      expv[53] = 16'ha2xx;
      expv[54] = 16'h74xx;
      expv[55] = 16'h5bxx;
      expv[56] = 16'h1cxx;
      expv[57] = 16'h31xx;
      expv[58] = 16'h33xx;
      expv[59] = 16'hd3xx;
      expv[60] = 16'h7dxx;
      expv[61] = 16'hacxx;
      expv[62] = 16'hbdxx;
      expv[63] = 16'h11xx;
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
