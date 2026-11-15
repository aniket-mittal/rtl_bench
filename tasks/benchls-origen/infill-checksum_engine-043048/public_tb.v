// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_043048 dut (
    .clock(clk),
    .rst_n(in_vec[42:42]),
    .size_valid(in_vec[41:41]),
    .data_start(in_vec[40:40]),
    .size(in_vec[39:8]),
    .data(in_vec[7:0]),
    .checksum_valid(out_vec[32:32]),
    .checksum(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h37dbd97f2d3;
    stim[1] = 43'h2f9f5155255;
    stim[2] = 43'h5e1b18f1a39;
    stim[3] = 43'h4387502d902;
    stim[4] = 43'h568b0b83486;
    stim[5] = 43'h78efc1f535b;
    stim[6] = 43'h7bbdecd3e5a;
    stim[7] = 43'h5d70e56f8cc;
    stim[8] = 43'h53cdce7582c;
    stim[9] = 43'h5dc3369efaf;
    stim[10] = 43'h5fe39bece6b;
    stim[11] = 43'h5c356e0b9b2;
    stim[12] = 43'h4d20579f0f8;
    stim[13] = 43'h76cb7ad550d;
    stim[14] = 43'h66366af759e;
    stim[15] = 43'h5e6953f9b4f;
    stim[16] = 43'h473817a7094;
    stim[17] = 43'h4c2a6f5e35a;
    stim[18] = 43'h4fddbc7e06a;
    stim[19] = 43'h5769cf536da;
    stim[20] = 43'h55131fa85ca;
    stim[21] = 43'h59d480cbbc4;
    stim[22] = 43'h706f1ba15ae;
    stim[23] = 43'h53e1855ddaa;
    stim[24] = 43'h4cf78b843b2;
    stim[25] = 43'h72f9160cd71;
    stim[26] = 43'h6302480094c;
    stim[27] = 43'h611d6ffbadf;
    stim[28] = 43'h618c3c54c83;
    stim[29] = 43'h75976a4e266;
    stim[30] = 43'h7397a7c470f;
    stim[31] = 43'h6d9bba4b601;
    stim[32] = 43'h6b7aa0b4f5e;
    stim[33] = 43'h57e571a54d7;
    stim[34] = 43'h430950da4a9;
    stim[35] = 43'h469cc8fa22f;
    stim[36] = 43'h4412284fa33;
    stim[37] = 43'h515e16928b8;
    stim[38] = 43'h581c50c52b7;
    stim[39] = 43'h7e5f977ce59;
    stim[40] = 43'h5598b432980;
    stim[41] = 43'h6560b7e49f7;
    stim[42] = 43'h58c25be5438;
    stim[43] = 43'h64d46a11d6b;
    stim[44] = 43'h7e96a7ce8a7;
    stim[45] = 43'h7c821d73bd2;
    stim[46] = 43'h58d4cdcf6b1;
    stim[47] = 43'h6d4c61f9fe3;
    stim[48] = 43'h59cb67417ca;
    stim[49] = 43'h716ee77d13d;
    stim[50] = 43'h7a0bdabecbc;
    stim[51] = 43'h7e1f43c00ad;
    stim[52] = 43'h6bf7583c22a;
    stim[53] = 43'h40c936f3a7d;
    stim[54] = 43'h5231b0c9f02;
    stim[55] = 43'h487d9763761;
    stim[56] = 43'h6b2362f41d4;
    stim[57] = 43'h6950eb842cf;
    stim[58] = 43'h39fe8c8a261;
    stim[59] = 43'h62a028738d9;
    stim[60] = 43'h5352efb0938;
    stim[61] = 43'h6b101071b27;
    stim[62] = 43'h460dec6682d;
    stim[63] = 43'h65d94f5257b;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h100000001;
      expv[5] = 33'h100000001;
      expv[6] = 33'h100000001;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h100000001;
      expv[62] = 33'h100000001;
      expv[63] = 33'h000000000;
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
