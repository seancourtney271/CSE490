`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   SUBMISSION 
//////////////////////////////////////////////////////////////////////////////////


module Program_Counter(
    input clock, jump_signal,
    input[7:0] change_address, // incomming address value
    output reg[7:0] new_address // outgoing address value
    );
    
    reg[7:0] position = 8'b11111111; // initialized to wrap and start from 0

    always @(posedge clock)
    begin
        if(jump_signal != 1) begin // no jump signal from control, increment address
            position = position + 1;
            new_address = position;
        end
        else begin                  // jump signal from control, set count to change_address
            position = change_address;
            new_address = position;
        end
    end
endmodule 
