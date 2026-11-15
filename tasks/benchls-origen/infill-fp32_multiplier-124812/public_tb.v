// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_124812 dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h5b1d1ff2a2f97817;
    stim[1] = 64'hbfa35ef4bea3901a;
    stim[2] = 64'h83a16c5da319f64a;
    stim[3] = 64'h00c765a181ed7748;
    stim[4] = 64'hdedf52c605a3300c;
    stim[5] = 64'hda4de2bf316fb5c2;
    stim[6] = 64'hafd704a95cbd4522;
    stim[7] = 64'h6e28af386ea6576f;
    stim[8] = 64'h2a4ca2283eb2ba7d;
    stim[9] = 64'ha007f5294e319a8c;
    stim[10] = 64'he4adf5df306bf4cb;
    stim[11] = 64'h11f923620704dba8;
    stim[12] = 64'hf03c8cb035775c01;
    stim[13] = 64'hb997304a75c8a35a;
    stim[14] = 64'h506274d9a88c5a3a;
    stim[15] = 64'ha06e364b4b68a84e;
    stim[16] = 64'hd96059f61f1955f4;
    stim[17] = 64'hded837ea1eb15315;
    stim[18] = 64'hce4a303784c655f5;
    stim[19] = 64'hfcadffec3ee1b500;
    stim[20] = 64'hefe719e384421750;
    stim[21] = 64'h504965c8778283be;
    stim[22] = 64'h326691f954247593;
    stim[23] = 64'h648c09d6c7ce2247;
    stim[24] = 64'h21df85a895dcf1f2;
    stim[25] = 64'h8f5bfe4b199e8c86;
    stim[26] = 64'h59a1d3e7717ce73c;
    stim[27] = 64'h79cf04b0f8bee9ee;
    stim[28] = 64'h1db08a3f1c77c4d8;
    stim[29] = 64'h48b2c3eca2f49988;
    stim[30] = 64'h613a549165db5e4c;
    stim[31] = 64'h7700d38f0f92b3f4;
    stim[32] = 64'h433f4883bf05af81;
    stim[33] = 64'h9261d7e4bf95bf11;
    stim[34] = 64'h8b5276e948e7e0fa;
    stim[35] = 64'hcba961f15c2cb17b;
    stim[36] = 64'haa31a66ce6e37065;
    stim[37] = 64'h9f93c440f1d24ee9;
    stim[38] = 64'h26602d95c863d5b7;
    stim[39] = 64'h606149a15f9d0561;
    stim[40] = 64'h73488e1d688f9b3c;
    stim[41] = 64'h24a1930735f71d1e;
    stim[42] = 64'h3caa3ea1002418e8;
    stim[43] = 64'hb77c08b233a2ec08;
    stim[44] = 64'h018ee85676278dbf;
    stim[45] = 64'hc6fcb59ad3471b01;
    stim[46] = 64'h5424497231ee0ad3;
    stim[47] = 64'h9571ff8538028e2c;
    stim[48] = 64'h3dc3fc51797b452a;
    stim[49] = 64'h9e0e7775e1b2b836;
    stim[50] = 64'hc9dcaced40da78a4;
    stim[51] = 64'hefd137babd427d7a;
    stim[52] = 64'hb473e508bcec8195;
    stim[53] = 64'haab07b00bcc32173;
    stim[54] = 64'hd052a85b36a19f66;
    stim[55] = 64'h1d82da1984311726;
    stim[56] = 64'h9c51e343407e607c;
    stim[57] = 64'hf63ac3b81de45e8e;
    stim[58] = 64'h7c610c78fc36b4a9;
    stim[59] = 64'h2db004783378a616;
    stim[60] = 64'h0abfa0948156300e;
    stim[61] = 64'hb5df10882c8796a9;
    stim[62] = 64'h4e114e53799fa03a;
    stim[63] = 64'hd43d5b54230ede25;
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
      expv[0] = 32'hbe991dc7;
      expv[1] = 32'h3ed0c2d6;
      expv[2] = 32'h67422a20;
      expv[3] = 32'hc338f5fe;
      expv[4] = 32'ha50e5b9e;
      expv[5] = 32'hcc40c8dd;
      expv[6] = 32'hcd1ef881;
      expv[7] = 32'h1d5b3676;
      expv[8] = 32'h298eddd1;
      expv[9] = 32'haebca52a;
      expv[10] = 32'hd5a0570b;
      expv[11] = 32'h59814c03;
      expv[12] = 32'he6362f81;
      expv[13] = 32'hefecfc65;
      expv[14] = 32'hb9784f6e;
      expv[15] = 32'hac587dd0;
      expv[16] = 32'hb9066117;
      expv[17] = 32'hbe15c4d4;
      expv[18] = 32'h139ca52e;
      expv[19] = 32'hfc1968f4;
      expv[20] = 32'h34af36a9;
      expv[21] = 32'h084d5aa8;
      expv[22] = 32'h47141f68;
      expv[23] = 32'hece18554;
      expv[24] = 32'hf840ea1c;
      expv[25] = 32'he9883fb4;
      expv[26] = 32'h0b9fdec3;
      expv[27] = 32'hb31a62a6;
      expv[28] = 32'h7aaadd21;
      expv[29] = 32'hac2acdf3;
      expv[30] = 32'h079faafa;
      expv[31] = 32'h4713a66c;
      expv[32] = 32'hc2c7c79e;
      expv[33] = 32'h12841b36;
      expv[34] = 32'h94bea241;
      expv[35] = 32'he8648678;
      expv[36] = 32'h519dd490;
      expv[37] = 32'h51f2c911;
      expv[38] = 32'haf478391;
      expv[39] = 32'h008a2ee3;
      expv[40] = 32'h1c6101fe;
      expv[41] = 32'h1b1bf73c;
      expv[42] = 32'h00000000;
      expv[43] = 32'haba065e0;
      expv[44] = 32'h383b1161;
      expv[45] = 32'h5ac48bd2;
      expv[46] = 32'h4698c33a;
      expv[47] = 32'h8df6d44d;
      expv[48] = 32'h77c05d56;
      expv[49] = 32'h4046eb26;
      expv[50] = 32'hcb3c5340;
      expv[51] = 32'h6d9ef2c6;
      expv[52] = 32'h31e15297;
      expv[53] = 32'h280684c0;
      expv[54] = 32'hc784ff0b;
      expv[55] = 32'he2350940;
      expv[56] = 32'h9d508e97;
      expv[57] = 32'hd4a69b4b;
      expv[58] = 32'hb9209dae;
      expv[59] = 32'h21aaf686;
      expv[60] = 32'hcca05434;
      expv[61] = 32'ha2ec49fd;
      expv[62] = 32'h0835352e;
      expv[63] = 32'hb7d359f2;
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
