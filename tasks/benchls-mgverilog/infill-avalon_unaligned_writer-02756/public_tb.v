// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02756 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3fcb0e157d567f7f44;
    stim[1] = 70'h295da6d7d8d7b8b467;
    stim[2] = 70'h0eeebeedd2c44261f1;
    stim[3] = 70'h0d1813beaa7a3a8946;
    stim[4] = 70'h0d55754e0c65181676;
    stim[5] = 70'h0869127d66962f55bb;
    stim[6] = 70'h13322d7ef354429acc;
    stim[7] = 70'h0fd38e79b9e6eb1222;
    stim[8] = 70'h04b187a24a643b2a9c;
    stim[9] = 70'h1568c296799d726101;
    stim[10] = 70'h00d231d6e4c428317c;
    stim[11] = 70'h0b385dc12532b39976;
    stim[12] = 70'h09cdceb9a0d4efe3a8;
    stim[13] = 70'h147916a4a547120ca7;
    stim[14] = 70'h060d8c2a82e596fdc9;
    stim[15] = 70'h17bdbabda597f6eaff;
    stim[16] = 70'h03af03dc4354e7b3f6;
    stim[17] = 70'h0197e96705e6279d7e;
    stim[18] = 70'h137807807638035f2f;
    stim[19] = 70'h1afbe2794f87691da6;
    stim[20] = 70'h1ec6130f339e304335;
    stim[21] = 70'h265179464552831023;
    stim[22] = 70'h1644c49cdcb0d2208a;
    stim[23] = 70'h0d5a16fad24abff189;
    stim[24] = 70'h1e3c431a36d5bd7260;
    stim[25] = 70'h140d2af1ce159235d2;
    stim[26] = 70'h0bcc6e0cfbd4e91146;
    stim[27] = 70'h00fef1bcac47ee10b6;
    stim[28] = 70'h1940acc417aa9e4aeb;
    stim[29] = 70'h14e0f133264adfb66f;
    stim[30] = 70'h16fd3e5b9954afde5f;
    stim[31] = 70'h1190030150c7bf79dd;
    stim[32] = 70'h1ea88e4ea14c33eb09;
    stim[33] = 70'h1873aa5cb917f04650;
    stim[34] = 70'h18ec818c5f9f03014a;
    stim[35] = 70'h085d5a89172257bf4d;
    stim[36] = 70'h1717ca0b3291c76f64;
    stim[37] = 70'h1a4763cf4b246a0db9;
    stim[38] = 70'h0ad2edc87ff2f6e205;
    stim[39] = 70'h116645faf6b4a653a4;
    stim[40] = 70'h18a9389f97bd278c11;
    stim[41] = 70'h1b28c89ab66ad27060;
    stim[42] = 70'h0c67f3948b87172692;
    stim[43] = 70'h0732005b6160b2fb17;
    stim[44] = 70'h06f7fb49a38a721339;
    stim[45] = 70'h1521d4579d49d536d1;
    stim[46] = 70'h06e1bdfb60d1200872;
    stim[47] = 70'h0a001650acaefcb649;
    stim[48] = 70'h1f17d954c010bddc69;
    stim[49] = 70'h089093d6e5f9cabf0a;
    stim[50] = 70'h09ab02e9243a43604e;
    stim[51] = 70'h1c699560dfc7c3f75b;
    stim[52] = 70'h0275a933dba4ae29f4;
    stim[53] = 70'h0a8f34ef1ffaf0c42c;
    stim[54] = 70'h17ab3acd4fd8db5672;
    stim[55] = 70'h0b0451a0bd8e7b603c;
    stim[56] = 70'h1fcbaab292ddb77661;
    stim[57] = 70'h1a70cb5cf7c4c8cc38;
    stim[58] = 70'h14954d91edfbc01016;
    stim[59] = 70'h0cbe554e0cb6f2cf73;
    stim[60] = 70'h0308a0b0086a517a3f;
    stim[61] = 70'h0775ddfec253698cab;
    stim[62] = 70'h0e6bddb9fcf5ddd73d;
    stim[63] = 70'h11ef100f52ecce6f81;
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
      expv[0] = 33'h1567f7f44;
      expv[1] = 33'h0d7b8b466;
      expv[2] = 33'h0c44261f0;
      expv[3] = 33'h07a3a8946;
      expv[4] = 33'h065181676;
      expv[5] = 33'h0962f55ba;
      expv[6] = 33'h154429acc;
      expv[7] = 33'h1e6eb1222;
      expv[8] = 33'h0643b2a9c;
      expv[9] = 33'h19d726100;
      expv[10] = 33'h0c428317c;
      expv[11] = 33'h132b39976;
      expv[12] = 33'h0d4efe3a8;
      expv[13] = 33'h147120ca6;
      expv[14] = 33'h0e596fdc8;
      expv[15] = 33'h197f6eafe;
      expv[16] = 33'h154e7b3f6;
      expv[17] = 33'h1e6279d7e;
      expv[18] = 33'h038035f2e;
      expv[19] = 33'h187691da6;
      expv[20] = 33'h19e304334;
      expv[21] = 33'h152831022;
      expv[22] = 33'h0b0d2208a;
      expv[23] = 33'h04abff188;
      expv[24] = 33'h0d5bd7260;
      expv[25] = 33'h0159235d2;
      expv[26] = 33'h1d4e91146;
      expv[27] = 33'h047ee10b6;
      expv[28] = 33'h1aa9e4aea;
      expv[29] = 33'h04adfb66e;
      expv[30] = 33'h154afde5e;
      expv[31] = 33'h0c7bf79dc;
      expv[32] = 33'h14c33eb08;
      expv[33] = 33'h117f04651;
      expv[34] = 33'h19f03014a;
      expv[35] = 33'h12257bf4c;
      expv[36] = 33'h091c76f64;
      expv[37] = 33'h1246a0db8;
      expv[38] = 33'h1f2f6e204;
      expv[39] = 33'h0b4a653a4;
      expv[40] = 33'h1bd278c10;
      expv[41] = 33'h06ad27060;
      expv[42] = 33'h187172692;
      expv[43] = 33'h160b2fb16;
      expv[44] = 33'h18a721338;
      expv[45] = 33'h149d536d0;
      expv[46] = 33'h0d1200872;
      expv[47] = 33'h0aefcb648;
      expv[48] = 33'h010bddc68;
      expv[49] = 33'h1f9cabf0a;
      expv[50] = 33'h03a43604e;
      expv[51] = 33'h1c7c3f75a;
      expv[52] = 33'h1a4ae29f4;
      expv[53] = 33'h1faf0c42c;
      expv[54] = 33'h1d8db5672;
      expv[55] = 33'h18e7b603c;
      expv[56] = 33'h0ddb77660;
      expv[57] = 33'h1c4c8cc38;
      expv[58] = 33'h1fbc01016;
      expv[59] = 33'h0b6f2cf72;
      expv[60] = 33'h06a517a3e;
      expv[61] = 33'h053698caa;
      expv[62] = 33'h0f5ddd73c;
      expv[63] = 33'h0ecce6f80;
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
